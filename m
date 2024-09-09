Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9DD1B7919
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882587; cv=none; b=Mkh4FF2FM6eMFQVYzpLwW+jtDtqs5ostdpiIZ/MkbPbTnAhFhz9+CbR/5IqBvSXdnMa+VQddA+uWpvXRqIVu30FYpdJ64IBVXy9hVb7SteQ4w94NkBT8KasUHbdtYuLjy+sgUkzb1riL6TK/RyDZnLdG21/Y2U9Br1WUhnHT8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882587; c=relaxed/simple;
	bh=QgtHIMpjtn3bGDdEa6ryJ9WyaUPfJvtSFw3QZhNj3SQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAmaxE9LQL27VhEvEJsgOmu0t1lueEtFyf/ktKJAZC5FbsIJ3CagOocOCppf5DIUrijAjcUcrjduRMJGUOJgQnClNz7teK5wFuYGcDqJu5GmuQbd3Gv/hESK7s4GhRpefMFznOY55VnU+rPpYl6Wcv36qJwyhEA42QStjkes7k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLM78W8a; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLM78W8a"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5365a9574b6so4136363e87.1
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725882584; x=1726487384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SrH5fJX/lD1lScDa7P0w2wLCrh1QxPnu0aKdVtdlvA=;
        b=CLM78W8a4eT6QNFf9rKym6lW3eGMyipdfNgTcQXEngOPSio+cs05GP9DKi9/erJKer
         CT1L+sd2DnHLmBp0Eh/Gh7L4UsmwA4OiOJnSR8C/LYVgxyXOFtL5T2tcCI3D9dRykMDt
         gC9zT7DlyrOmPh72njUXY+/oMy3P4vpJ0Y7xnG+Bd6PFTSaDaCh8CteCpoUHbzs2b4Uz
         wr9wF/w8rkYIB4h4eaNVZ2wJLqkxKs1RgdHY58qfnQzawxRqxTQuMI2AqNtj0DayzGYO
         mjGdpxXmtz0NSGYe4Qr9ReVqY3zSaxjqHrvnfBVWLV3cre6yshbscJ4ukuhe/PWJV5RS
         rWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882584; x=1726487384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SrH5fJX/lD1lScDa7P0w2wLCrh1QxPnu0aKdVtdlvA=;
        b=Q/gS9m+d5qU552MrQxdTWU9VUJG6yv+GFvHn1Y/4Emj55dqMPjqZukyn0yXgDTeykS
         Ux/ud1Lyz/aKQEqY/p3JhLpeQAvWfi8s1qCEenzq+jctTyzu0ZFuj0Ljsn2dVNdBTevo
         CrZxIKVWG2Eg5DlZmKuApQQ9CcRqYsLkGAvTo7CweC+K+uzYDFRJBfHoGnf8Z6G1bwXN
         w2C8qi5xLz4fbARCpyLcbf3EEWSAbjVu/rdxRtNjuIKbXJGEvPjTe9v4mChbY9WOi292
         f/gGZpcG/lvSA9BkVS/CT8259D++1HcZVm0IDoIubY9xexOnjMJYb7/bIAbz0Azmku5Y
         H88Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkZV+PhUqz1rOTTCk/6fjxh22hJ1ODnazg7fvPyYwSCimYVLaA3G5Y7YxFK6WR6TZPPzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YykthjrT1m7x3XW6TjYDSYycIn8gx/UO9aUIeV9AUlIZEho9+4t
	kXzqHc7YlTVKRKZTmaef0VjL7FwZZhWp7UmJfkC4fLZON0H77d4S
X-Google-Smtp-Source: AGHT+IEFlBY64a4PNwKClA+dB/6i9d7wohMcmhw2O+Ea8FAfmTqfSbsQcuFCHgj6kSiZsUrDTBHILA==
X-Received: by 2002:a05:6512:33c8:b0:535:6aa8:dc49 with SMTP id 2adb3069b0e04-536587a672emr8694852e87.9.1725882583246;
        Mon, 09 Sep 2024 04:49:43 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835697sm333258566b.16.2024.09.09.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:49:42 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 3/3] ARM: dts: imx7-colibri: Update audio card name
Date: Mon,  9 Sep 2024 13:49:02 +0200
Message-Id: <20240909114902.82380-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240909114902.82380-1-hiagofranco@gmail.com>
References: <20240909114902.82380-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Update the audio card name for Colibri iMX7 to match its specific SoM
name, making it compliant with the other names for Colibri iMX6 and
Apalis iMX6.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 62e41edcaf1d..8666dcd7fe97 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -120,7 +120,7 @@ sound {
 		simple-audio-card,bitclock-master = <&dailink_master>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&dailink_master>;
-		simple-audio-card,name = "imx7-sgtl5000";
+		simple-audio-card,name = "colibri-imx7";
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai1>;
-- 
2.39.2

