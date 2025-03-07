Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E43213254
	for <imx@lists.linux.dev>; Fri,  7 Mar 2025 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741342696; cv=none; b=fcCdrRRNELGawSrYRUpuzLYxgvwOHzyZlHepBWqPem94tXUBOqbgHamnJpTu70rMMxyya3h5B55GNoZ4DRdlrK0yYBcwz9JVIVJqXaipbqMt7Y7FfFVDn2PjsdGtQbAbTf8zfljv5AnBej6T2LmKsHZ9dZQV2Z1AFp4Hus7WrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741342696; c=relaxed/simple;
	bh=Hrpk3fM2ToSeRY6ZSJ5LgTGAbZEfHue5uXU35dGs0RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctMGIG7ETedR8SKyFsPuSB/qwGVOgRKQDT90zEI6OI7hg2+J9JUEQ8YIx9v2jBE8kbvfsx+N8qp276lqHT8N2ZvFkbxg2+VAWMnTUWnOq8eZw+gmV8yjbvQnJIoWDla0WsPq/JNn2hGg6u06oxndNYchowC7kUV8wS1m4Fy7ZZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioKkf0nx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioKkf0nx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390effd3e85so1514233f8f.0
        for <imx@lists.linux.dev>; Fri, 07 Mar 2025 02:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342693; x=1741947493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FalLckkLy2c4ipBkbA3HgidqaPtgkZG/OVl2zJ65m2Q=;
        b=ioKkf0nxi3icUjpfl5xyMSOiB/vwxI8axNHuVUoFsysDwtKrqNAWt+Z1AsdfsFB47S
         FOUc87lIq/dldigUhWTRzoSr9jeSbT69phPbfTm1h/gBzPKdLRcXwDPPVQRGGWHcfOn5
         MTYxUMND/TUILhvoi6pOvfiHNokB5PRnBqMZA/acVYNt8duv3MhxieuRCKXJhOLteOmy
         bEXRVTDUphcPNz0G8xXhnv9utVdii6hYR8fpKx+TxRrDhGu6m/vNME4Yiq6mgBdAa18a
         mSGm5k4XDuhARrQygv53s0b/2FDEvIGDfoZhIWwvTQojZzCvX+o8OHJMl8sVt6cBwjtp
         2EPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342693; x=1741947493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FalLckkLy2c4ipBkbA3HgidqaPtgkZG/OVl2zJ65m2Q=;
        b=lnx7cECcRiCXt/slPNqWlI2QhIsIXV5O7V50OgQRltZLG3FhO6qiBkswRwdk2f1fBK
         Ae0TLTt1JOy9xhE+s9gCuNkNBUrr0kuifuj8Uet0zlQbHVDOx22eoUez9njSjchTMllS
         MeMAKUQPJyb8sa9TFK0WJ6AQgQvGf4/EqXy+TCo3BYGg1AB9ALz4P9hQPe7vGQiHTO1x
         gaAsJ50t1YyUF5jCASifDuoavzuifdZyEmDiv/WMudi71ETd5RyBfUROdprz4+HTxoDx
         +B7/IYp/6mWeiXW9brga2e917p7a4RfUFLJ8aUXIRxEJA4Jm8ZX8BEx9vrlp138qWKgT
         uxgA==
X-Forwarded-Encrypted: i=1; AJvYcCVL6TEZo9IxjPw6gPF03dlF12n6DPZgspvBYz+5P32Nrc3pAUqrHZ9aNTZU94hPnqK2h1A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRbjB2T8111Lw94N+azmWUEaCn3bBU06IduWk5mknlQUtYTHI6
	MjfNTtAEkuiZaNABgf8+IgK9HCXkfa78lH8hCJ0TeVyLckQWy47I1Q/QAHAI
X-Gm-Gg: ASbGncssy52wCEDmihGwjcmhB0axmS0iAD2z4HM1FOtQUAUI2hCHtDZHR637j7r8OMV
	bZfzJ/Tslmhd5IArA3EwEc5xZFpP0VMR0GJgsT09fSUVNifRjo0iOk+MK1apD8SN+9q/UvGCKA8
	4hdYPerec4eH3IrSme/g0a0C61dBjduYFJj9tsAm7OInjiQaDGMr12jMVvEn4Jb2q07lJMZR4Mw
	l46+gR5h6qsKW2E4nnxurvYb86PqGMpi/jwoK7mlKCQ3nLmjmXH4ZjVE/h2KFoq3oV6EdCQsNI7
	TAOpxKv8EsfoPLuaQUzQ2gaQbnRY48aF4Zc6PIIVeeMX75DdfyiX4gis0UzLO7L+yLDYKikPsoF
	jMwqVuiTEEFqUWHYpr2aW/TQ=
X-Google-Smtp-Source: AGHT+IHI4qarjn6okL8fiFQY3ltBC2yY6DhIkGRizLqTlNjxjx9HKfSflu8OqxGOPt8PeQnTelbnew==
X-Received: by 2002:a05:6000:402a:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-39132d6b61cmr1665637f8f.20.1741342693057;
        Fri, 07 Mar 2025 02:18:13 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103aa5sm4900262f8f.94.2025.03.07.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:18:12 -0800 (PST)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
Date: Fri,  7 Mar 2025 11:17:48 +0100
Message-ID: <20250307101758.27943-2-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
References: <20250307101758.27943-1-ernest.vanhoecke@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
part of the SOM. It's self contained within it, therefore, disabling it
is not the correct default behavior.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: Fixed the "From" field
v1: https://lore.kernel.org/all/20250227170556.589668-2-ernest.vanhoecke@toradex.com/
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index dffab5aa8b9c..23913f18586c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -664,7 +664,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 9f33419c260b..9a9f9764dc65 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -588,7 +588,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
-- 
2.43.0

