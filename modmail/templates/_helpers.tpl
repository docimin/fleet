{{/* Name of the Secret holding the app env (Vault-managed or pre-created). */}}
{{- define "modmail.envSecretName" -}}
{{- if .Values.externalSecret.enabled -}}
{{ .Values.externalSecret.targetSecretName }}
{{- else -}}
{{ .Values.secrets.name }}
{{- end -}}
{{- end -}}

{{/*
DATABASE_URL sourced from the CNPG-generated `<cluster>-app` Secret. Rendered as
an explicit `env` entry so it wins over any DATABASE_URL coming from Vault via
envFrom. Omitted entirely when postgres.enabled is false, leaving Vault's value
in place.
*/}}
{{- define "modmail.databaseUrlEnv" -}}
{{- if .Values.postgres.enabled }}
- name: DATABASE_URL
  valueFrom:
    secretKeyRef:
      name: {{ .Values.postgres.name }}-app
      key: {{ .Values.postgres.secretKey | default "uri" }}
{{- end }}
{{- end -}}
