Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA01CF29B
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700518; cv=none; b=TwnDEIbONG9NIDx9dN7pfyy8OwsZHsY7BE+Er9m4Y0vBLfbV4DeJIF9a2r942GzOyVojnLz1L7KjQ0L01Fd3UTBzh7jRKVa9DP6ilxKl5H1Ks0CbJ44t/VIRgoUjUmAUv4RMkj4DmXgvtXZ8/1DVdmYRH5yw06Va4rQfuhxuDgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700518; c=relaxed/simple;
	bh=aD4ZDGMB/0Exiwv1vFpmzxZEkElwM8K5XNyCEfr/VBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9Jwmod/Yew41PnZf0qEeufG9mo/JgYuwAHUCwM1IzVHno3e4ZLmGUGd6GQvKvdWY8o54YH0cuPBiXozeFc2MVuZIx2XeRdJQC16DbdTprez1nX9doP2vBZps11azQHgsSuppx7ZWslBW4aUNb04zfxpW6+73LM2BUwcaUOpSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2SGq3fI; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2SGq3fI"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so71959001fa.3
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700515; x=1730305315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=;
        b=Z2SGq3fIk9Z1vi2Fq57i3OatO1Pwno7kUGiT3jjmNkAt4YRjJr3wFN4+ioC7w1n6Sp
         9PxvGZM6Rs4g2XqJiFZTfx+wP04hm1NZFoBePT0rr0bkHKWPPHkLKQfq9EDQy69Zbs5u
         hIweL47wNGKlSz36vXAoy3h1kGiCuGQOj6eWwGKh2S9F3UEq98xsd14seTOxz4UUDNr+
         jXhiPrOXrP1zWyp0hL5N0ZYAphA4Av0ZRIE1Vj0Ay8iEhCKV/OS4tTkHIjaXOuycO+5v
         W1jW6Sqt6e1xAlRTfXp2iNP6Si1ZIqEZRGFSxY2OQWS4aDqF3PY0cbDlPCgvA6HFswDW
         M9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700515; x=1730305315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T91d+bznCB7MrilGZZnGDp0TGLFXhhuyuq/BXHaJaU=;
        b=V5OPCD68ooxS4jtEwC9avOq2oUcMmmVM29laH96+ziV3Quno1uzPW89vSnAxh1yVyp
         FHGO2lRr+4Gj3HweCMrWTdI16EBEFy4F261PjINLtjvy7b3ayi2Y9iJvRDtI6PphzgfD
         3AUnUcShWp6mU14Pj4+HwR6VLh7+afXGEX3T1xMZJ4S0xEqH8WLz9qY6fIzNKvBZapVi
         SoC7LtZnwgE0otDuvuRoBaKpge3yNUAIwodUVp9XxNkFMOQ2mE8+a54wAEVDafeGrwPB
         Ic59fGMiqWaHU+zs2zPeL32fbKXqKY5qhZNW0ay46snQFrNDKRZ6GtQDqbl4MQNlTKTR
         QnRA==
X-Forwarded-Encrypted: i=1; AJvYcCWxa+kyx8byYsuS8w6uq+Md/k8qfWxP1oGcVzgoPqYgxEZsLhr88qlCVnFybMK3IcKhnGk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUeNFQfqIawDq6Ost9zl5xmX0FKpKV+64gPPjyNrZTxqjx6OqL
	6It2jlpoKEnsHCtU/DT1ZQHCWmECMRfJ5tdgaXIgte8o2uhDUYwh
X-Google-Smtp-Source: AGHT+IGSuRDP9QiG7QKq9fGBE5EgHFrsYc0Z88Wu4omye9JKc34vnBuHAWvJD+QR/DERkoh54VOejA==
X-Received: by 2002:a2e:819:0:b0:2fb:c20:dbc3 with SMTP id 38308e7fff4ca-2fc9d5d4042mr14177941fa.39.1729700514531;
        Wed, 23 Oct 2024 09:21:54 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Wed, 23 Oct 2024 12:21:12 -0400
Message-Id: <20241023162114.3354-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..f0300a08f7fe 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,15 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    maxItems: 1
+  widgets:
+    description:
+      User specified audio sound widgets.
+      Each entry is a pair of strings, the first being the type of
+      widget ("Microphone", "Line", "Headphone", "Speaker"), the
+      second being the machine specific name for the widget.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
 
 required:
   - compatible
-- 
2.34.1

