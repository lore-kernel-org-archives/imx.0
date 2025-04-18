Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507D22E40E
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006411; cv=none; b=Kz+kilJEW8j+fVxfvJ67S45qdkb41/URI7U+JgDj3eplJgJTlISTI9oh/+LR7CGjmPuBRhURsd2t9c/iKiY1dyTGCQFN5oSNZLAtND8xnQonqmVfzK097EHVj7IPa1gkh17lH7V05T0jldRlvbrzmNmsTQb/MchLHFhfCheAt5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006411; c=relaxed/simple;
	bh=anywE7XPQeNCDKeK0PUagrE9N3D2Cd5D3ok+OCQfyOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5F9vSqZV0ssUTU/ucQXH9p1oD2wOAFPoM6uYu19AgmQxt5d2sVqRoCxClCV4HAOMZrebEAOqnQE2CsRJ4Ti4NN6n3K0X9T+6UA+mhIa5qpNSBs3FtdDspMkpWzwI1orhCoMLFyLcDCA87i7Y/JUZ+ZdBW7e8RT/ChcusOmUGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K1tZS28y; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K1tZS28y"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6044db3b45bso1228375eaf.1
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006408; x=1745611208; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
        b=K1tZS28yIf6eL9yLNbjqaLPMNLFHexGVCRePpzTxt/Y6NthaOw8Yez5ENRyJsZ2Ccu
         z9255+AK6oA36MuoF5VjWa8Sn3L3g/5qlfChGLFqW+EEEtXtMn/dY46juT4HEGWfAKWP
         4PF1lOeWFRqathS3qjkqCc58/5Hu8S7PgX7vNctEV5EEw5qoIttLz0ZSV0IlAWIlsY7J
         COiM23kJ1Ceac730Ok3byxjwFVwUDgpoW5pItlP98egKwMITg9GU6O66lbxmq/YzWBFy
         ur77wx93/eVd3IIywAZNMYNAx01jGgB01NQUR2usKkKkYCAPa7frTEQ4/pWEpbf5aKf6
         AA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006408; x=1745611208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
        b=EC+Mv6TwRrEj021F6ymwgBgMow4H/nP4aqtd9ab94NmeCrbLH3JqpvylQAqje1TiZ0
         Mp7Xrciyz3aNXhnz3EoY5mBOL6lqCsbYfxU55UYX5Tnh3ccVBzbRH29KIs/HUECiVBkp
         IrNLDYxV3cxyphDLuAJd0LRtAJDz9TVsbpa7RBvA2GRA+h+l82sGyCybp6GP9moseYER
         CECYRJ1KkrU3jx2IT815/IKNDrZG4kUvjUVoFqqSkYr39ZsIPhpfBP3i7fZUaprEBMr+
         6mFI64DhH7ZsPErt8d4vTCn7k8t87CKEIGp4hcS/7fXQa8v48dsKVBZkNP8wXZDN8Wr+
         Phbg==
X-Forwarded-Encrypted: i=1; AJvYcCUWXQDeCo0qkx4FCaLNTfOZEc2DTUN1uWVkxwoYdQ1LcWJunmdQKIp5viKALUYrHTZ8lRM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/96akfQcAK6bP4hJqA5PCGxY8LPnAyNk6cQ/SmWfFleKht319
	ZnPIIgOYCck7gP1fnKZWtiMkiVmqs0WUVVxBF1bsND5OEdjMwZOlTsbeghnsRPw=
X-Gm-Gg: ASbGncvniUBgCNTvh3gUf4IZjZd4FFyODnVKMIy+ey3wMl4uly4kzezE6bBkDOfEsX/
	X74A9dQp3HiR2/0VCU7LoFJkKR4jDgIA1B1ouaRcafoe3RItj2vF7C8qIE08no/ukdWHlfpNr25
	76S0jnNMAZ/X1FjexGqmYoOlJ3yaflL9nJJ1ezNV7ThxqHg/QxumDeU8xNT1ECJ1gLTCMPFgYW6
	Iysy3JGaJLd9t8jv778FGP/SHlOw/K6bhjhpKelkJEaEwi6V4czb872gGYDeIC/OATjE6mhDbr6
	2tQFlpiIjvBQvlsdiViUFsGlRlVYIIHFemXvIM3dUD3iRFmEB1xFJSZnfg==
X-Google-Smtp-Source: AGHT+IGr6jWJlv3BH4w4Ps2j1330V0WmKydx70JnXcNoazpPHvVerIJTYwy+J7D4DhPX9Wk8OvfSYw==
X-Received: by 2002:a05:6870:ec8e:b0:2d4:c55b:199a with SMTP id 586e51a60fabf-2d526af63cbmr2074229fac.18.1745006408488;
        Fri, 18 Apr 2025 13:00:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:29 -0500
Subject: [PATCH 10/10] iio: chemical: atlas-sensor: use struct with
 aligned_s64 timestamp
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-10-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=anywE7XPQeNCDKeK0PUagrE9N3D2Cd5D3ok+OCQfyOY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8nzp0+Cmfo0t99KU1QNh1dT37rrLQG2SzNH
 U5outJwJB6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvJwAKCRDCzCAB/wGP
 wKuNB/9sC6Bs/gHTswHlJCsOQM/Cjv9JBeFqLqwPG/EH6lPVnuMM2r0CjXLaKZ6Sod/kwk+E4pt
 PNtFh4rt+VvxCpXg1H0wPTud1mMFV0tkDA7sJwxDGX3Z94mw+p7WvzEoCCCx9HSBkorH5YUMaBP
 FCGeNDyvZQ9+L3skA4biUuoQKswoX/yqxNlCaGcY5dG++zXclH3PsId+6ITHnGlrGoHnpFcs0Tk
 2lRJbQaIhxof9SiZNt0q9xABQZsm6NFC63JdQGq9OgxSD7qaa/0W45hSH8XuZCCJndZw/VVEDwj
 Yi1sy0l4M68NpXKzIiV1vXzyy+beWErhT1Jlka5PNTGLOmpl
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index cb6662b9213740f4a88b8412e6a0f01bc5a314d6..a67783ce7f1b68135e05d3afc05533d400d4a052 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/trigger.h>
@@ -91,8 +92,10 @@ struct atlas_data {
 	struct regmap *regmap;
 	struct irq_work work;
 	unsigned int interrupt_enabled;
-	/* 96-bit data + 32-bit pad + 64-bit timestamp */
-	__be32 buffer[6] __aligned(8);
+	struct {
+		__be32 data[3];
+		aligned_s64 timestamp;
+	} buffer;
 };
 
 static const struct regmap_config atlas_regmap_config = {
@@ -455,10 +458,10 @@ static irqreturn_t atlas_trigger_handler(int irq, void *private)
 	int ret;
 
 	ret = regmap_bulk_read(data->regmap, data->chip->data_reg,
-			      &data->buffer, sizeof(__be32) * channels);
+			       data->buffer.data, sizeof(__be32) * channels);
 
 	if (!ret)
-		iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+		iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 					    sizeof(data->buffer),
 					    iio_get_time_ns(indio_dev));
 

-- 
2.43.0

