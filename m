Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701B3093B6
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773809; cv=none; b=epNXHMDhfgXCUFVniY6x7o1socnNVGKK/CCiR8P3CL0RxLFZRRIHXd3rNdfuaH3IJRkyzLL2DdKHYpveIHO/t/mseu2rN6vul6OT9c5EraKuKqaZYh2Dtv3ulJS1QKvhQ6ZKkXQSymLKtW0PAHMqz7k9Y+ETd3pk9ZIHcyBZOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773809; c=relaxed/simple;
	bh=GfUzdHKNLuUCeROo8QZ9Rj8Ue4x6+JxUEAvaTCuZi9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYyaS7CgPpYfWiiUBv3vaIhjZR+jhwXx67V9qT1MdaoK98f4IftaLec6+K+stosXbxDwXVslCauDZyUDQFPuRQ9EXSXVLmTX8z2IGHFwV3p2NfBWRJwugQpp797Z20PzafPcxATiNCZ85wfFRG5rAeTvefunOFJCOM7mki2Ebls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvUcfnNV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvUcfnNV"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7a2befdso127517466b.2
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773806; x=1756378606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEM6zRrG0wrRh1d0tdQzRRFEwI97+Is2fI98UBxa5F0=;
        b=SvUcfnNVdo9h68ddcKn0T/8+Kfq/zWE/Chboe+ba/Rc1lG8uQeYdWmO2xhjz+LesH+
         NLXo17InspfAEay2IqGg+2CcWdVle83Z6q9rtS6c2JPB73x+uUX5G/gYLd3H04J7pKRG
         ZDP5f+b61UygejVMbtsg4vSpvuZMDgVrcWHafjlRiqrBUsbo/YVVaLDDttEWWqFaAz3c
         KAyEZWW1Bn+EhuqUzbed3lDX10RmVrJ/K6KYviJ1sdPXwJxIBDleISiroJ0Q4xXYV/Pp
         C+Rc1SsO7uziUMDxCrxkAaZDbhXKIaqE13RcZvqhw071SeETxJH6b+J033OkuhgDh/wY
         Oq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773806; x=1756378606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEM6zRrG0wrRh1d0tdQzRRFEwI97+Is2fI98UBxa5F0=;
        b=Nle8E3Zm6Qs1quU4g7QaK0x/I6L9Gi+CMD/E+jIFqcGHbw8aSY3dZHDWpeSFx8qVZM
         zdKpQsZCHqkO2ymsg9nedIP9Ug6mw2CqzY7NfSb1W0GJFRfY5zcSk2H08h59jio44eUc
         u3H9wUAMVuOuVdiPcKtjQSBLx4DZckDxHJCfEQT6KCiIS+sRS21enKF1yHA9/Fq//uc/
         dYbRKlvPkDpCUyZ+zQni7CkUCuWadBVYEvsVJnEoUAN3qSniCIUcvIRzEFo2cLAbq8N3
         IWDz+e0X7Yxj4KyDqZJe+7YGg8yAOXip5KAl4dkC3QqhzFjeHSLtdoRKZbUb1PhyL5Wt
         3C0w==
X-Forwarded-Encrypted: i=1; AJvYcCWkN9S7VTo0HNGGC7D4R1x3rOFv/JFBDk10KoEdJTqefcmSClY1M4QOrhQSOoh8haEpxeQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyutGEG3FonwUMWZPbZg1kxo0kWt1GLesmhrU5T28wjz/YIiMj/
	b2loZ51/De7J5QbeySLO00NKjn4Dc666/2fA8iYoPHw1CEN+5WvyriFJ
X-Gm-Gg: ASbGncuvWCHdr3tSZOI+BwdZ4FHmSs9SGSNAmsHFpwETITv9FaU+AEQFN8XHKJVlUma
	5pRG8UlNCMkQvbHfanvNpmGK5nxOxPCi9NiCOWoJszI+sQjnQwYIWJFxvKhdie96p6YXryGK1yU
	Q2WVWKMUo73dNz1UsF5KVA5GeTsqie4r5pWffjVo6UztBtfJCC3gwiJbGmpg0SIBhs99mB4fbrX
	BglftVLXg2Qr8lWntdoe0cWR8fVY5g8AR5vst5DFEUWZikQy53WZXJaRhspFQbkD0v1C/mOueHB
	SgjkPo10lqDwwvtNPPRs/VDGG80SqtCU/w9IiZmmRaxrW6LQesYWg3mRz6jMfqy5wL7emmCfKP8
	KNXRlpIqbd5lzMzJXpflKfr8rRZFmEXKcy18rNMUkDd9emHyOBm/O
X-Google-Smtp-Source: AGHT+IFVorh0obeXbG1Ko6UmVI+44XxAfffiT2uo5FSHfTA7gezl9y87WX6WaAGvvAl4Gewp22sq5A==
X-Received: by 2002:a17:906:478b:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-afe07b3d5bfmr194996966b.31.1755773806255;
        Thu, 21 Aug 2025 03:56:46 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:45 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Thu, 21 Aug 2025 13:56:31 +0300
Message-ID: <20250821105634.1893-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 667c4859ecc3..23ba01d37263 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.34.1

