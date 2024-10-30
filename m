Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CCD1E8859
	for <imx@lists.linux.dev>; Wed, 30 Oct 2024 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290902; cv=none; b=Bx8yQ8UMNnH8dOgi9KEe+bPwuHavVtZGI/AkXix2oj0xC8hUAbdUOetw4mGIfUWUjWMbgP1RbZP+Zxgz2EFZqOk0prD68EIBPUDP19Z9bYAiykdzN7b7VPeNhbTVYSn1sq8zSqYebkuGYf6POy6BNG5QP6KurOaGCaIPkpeMhXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290902; c=relaxed/simple;
	bh=3xH3qWof9iskT+svJ3Ofkpc3VWG5qZ2V+ON244P64yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UNSJuR9sOrkRdZCPxrAL81kQIvGa+CAcMVBbEscWRG37gK/u0EJovXV8GIpn/038w153ytOUgbRHRwE2MRI57K/+rCyj/d/VxoysLKcaz1kt1+zRJ2SRweHozwzyx8AHEBOV2st79haRVgxVvW9SaOTDYP3EduaDhQDHJ2bRZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2bCwWeP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2bCwWeP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so8527034a12.0
        for <imx@lists.linux.dev>; Wed, 30 Oct 2024 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730290899; x=1730895699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mU7t2F60MLsG2LmsYh482PvDcQpTzay71lGqfQCsp9Q=;
        b=a2bCwWePJfWwgDa8Et2XGZFaN+ncwiSG0bNAhiIBP1yKu88vBtgs8cd92m7mtcbVsQ
         8FJZph5CIM3p4dttCC283FmvflMTgClpUdc6lFkqRmXUNI2d6JXSDRdjZDtNXCCvOYH/
         ByC6y5QzTDULNCdlUBj01+/zV1x8qYu2WIie00ZVE35Msyq8lntAsKk8/LMXSP4RNIZr
         J02e0qqROJIMDs8COH1tMrzKSIc8n7N+aFpyLTTvoCj3ArqbYIp8JUVTUnzkqcMikzm2
         Qcq4vRxebbgyIhMkU32F3PBfFTx/WnNl4Bj6J95l1Xixl6T+12wQ56euvV6TBt1OX8Rj
         K/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730290899; x=1730895699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mU7t2F60MLsG2LmsYh482PvDcQpTzay71lGqfQCsp9Q=;
        b=r2PzMKMtzlq7DjCDBXDLt51sSRAXzjjmhX+ALZ5RTw0V7DePJf82/rxXhWPui+7o5a
         XNrpLk0dIQeNZ9897hxGe0xq5qC16YXZCsy+t1dFkXDtnIPNmKv03qyNAXCoP02pHWVD
         V+gRLqNKG8lvBFigPpUS9FqsaeBockrkxrc1tbWWFgikh/CGpBXdbexNrc4k/JlxNm8T
         kms0AcPi/dle5MP+9Jyoj0C929B1MnXFnCQwyM3EJnqhxq30w3TSCcq8A7aME1lxuCeN
         bYbBP2R4TJe+CTvOLFOsdA+wVPcKAbIS0SDJ7hziLkBiF/EzjV47KUu3fNZqEDPT7Y4m
         K8mw==
X-Forwarded-Encrypted: i=1; AJvYcCWcHDx/i38lZBBQ6dLdGqFyy7NXfSLwFHgxMgbeqvWemApiRrcBqpOJ31s5fOwDzXMN3n0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx05LzrPmX8RDHyVrFzGCO0UNFDA4K00qTmwAMdGYkYKf9vlBaj
	jXHIFsw6r+Zbb0ctlw8ShgaTgfcuSN29NjZBUI8UGB464S7hFT1D
X-Google-Smtp-Source: AGHT+IFLs++qvOnrQcBcH8hYdDdVxrrVuWucZjSjakPaFv4ezw0P51xiY+UuomQqQpb3qzlI8z2wIg==
X-Received: by 2002:a17:907:9487:b0:a99:c0be:a8ac with SMTP id a640c23a62f3a-a9de5ee477dmr1552093866b.37.1730290898593;
        Wed, 30 Oct 2024 05:21:38 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029890sm564494466b.56.2024.10.30.05.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 05:21:38 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: linux@armlinux.org.uk,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	elinor.montmasson@savoirfairelinux.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Date: Wed, 30 Oct 2024 13:21:12 +0100
Message-ID: <20241030122128.115000-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
card node properties") which moves away from the old "spdif-controller"
property to the new "audio-codec" property.

Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 333ef55476a30..c771d7dbcadcd 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -321,6 +321,7 @@ CONFIG_SND_SOC_IMX_SGTL5000=y
 CONFIG_SND_SOC_FSL_ASOC_CARD=y
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_CS42XX8_I2C=y
+CONFIG_SND_SOC_SPDIF=y
 CONFIG_SND_SOC_TLV320AIC3X_I2C=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SOC_WM8962=y
-- 
2.43.0

