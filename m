Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F39A207217
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527608; cv=none; b=m4DLC91SS5Pz6W61hAT2YDUlT/zonX7b+3k9YOewBnfCSgStyPhB7H5RqjS0iioVGlgabn5yherCLnvT3y0CCfZAEcKOCkjzXmNM+pSNRJ7zLJNhWNneiFzz4hlV7M8BG/LY41u+czlDQJ1tTZKaGu1/Q5C3u6i8ceHJLIdIpm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527608; c=relaxed/simple;
	bh=cWi8DmSi7C7RoYGebBs9V11KbEf0JwdrdWWSFkvT2/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mz6yMv1IRPfB/BwKDNnv44qqxpaLB5635SzkPIPouNrw3hlKWyYHdrGyZ3fqCwnDihfPRqChbeWsaEzxgsIj6NJft51FaGHVkj24vLBFxlD+VGb3nGqHAF8SBhLo0u5/P6VBiddt8w0K6C8Hb1yh0CPqNWI3BcZ1fjMfugHaYLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty+htfY5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty+htfY5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so63778015e9.1
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527604; x=1732132404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=Ty+htfY5T5Q6uGyP0l56YKKy00dhfUzdxh08IqbievPEhqbNwJnOWqxPBUDiSV196Y
         wcnVFHk0oW4d1fwxxMhCrX9y85rf3D1G9Q5Mtx8hLzCIexIZfQ35IdTuQ4453oZOINBY
         sGIsQetmETq0BSp797su/RitSenCFSm8Eet5UK+OEb6yuhhRQ5eyZUbPwsCCBBcQUL4T
         oi06kPEwZvv7REKzgsrRS15ehFApv3v1JyrS1ROBO+4/iuvldXn8aVXujU+oA30aGJWa
         AtEjtC5EZpsp/3Y9YGh65RKN2pT8VS2VmbA8QFhmCitpv+PMRmWqfI+XqMCRrDXbhjgI
         6amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527604; x=1732132404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=ocm1sa8URjhsVno7HfeT4n2wq20Cq+HikgyreF8MEMbI6IlT6kzqWnaAa+ZL7+p6kJ
         QV1OI303ESdGiy0aBOaxpZCRN26hCcGdfMQyzqQ2JCH8HGubMe0PLjvK2hnXJ4s39Bfc
         jY0XSm+M/OsR91LIUa/EjF9tiZQWTMmLs1XctK69YNhhUtPeQ81UiLG3XaE8AmIW7gpi
         pURN3dYts6SAXrYcsdyiT+yFIWqthht7kcAO1yOes1D08QaYYltaesXnnLDspXs4SCsM
         Iy4cjEc9X4eWUafcdviuPFzOEPTpqHA88v39zxcsm7vdVWRYPe7GncVMLIY3ynn6yRIb
         bgqw==
X-Forwarded-Encrypted: i=1; AJvYcCVnMv9t+hnC4zCr28IsN3swXWgidtt7ylX++nEWaClny4wXdZeRF6ytMI7He4lFl7lDWQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWf0+Zc8FIHdRikCj6ok5955MgCV2+8TGdpP8GHv1YPGq5WXF6
	f5ENsAgKGSTC+I5ef1A661NIu04Md82hPcNCciepjJHUM/sjBYrg
X-Google-Smtp-Source: AGHT+IEANOLGqOrMck5zuaV/awm4uDnLiNsDYeECS1iqXbhkM7NIIObAN6edW4LT/VwwrIADcKG8Jg==
X-Received: by 2002:a5d:5849:0:b0:381:f596:392a with SMTP id ffacd0b85a97d-3820df8884cmr3387252f8f.43.1731527604134;
        Wed, 13 Nov 2024 11:53:24 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:23 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Wed, 13 Nov 2024 14:52:38 -0500
Message-Id: <20241113195240.3699-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
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
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1

