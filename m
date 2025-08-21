Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306930BF62
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773813; cv=none; b=kFhbY/8lySHVklIuBUxSuBPMYhdd0xwSTjaWj1tTt1ybpwjt+thCuNL6wQeTWBcxh9Lrdlk/ltB4d5Tuyv2JQawu91TTEJ3vyPukBtoeabLkbwdp4S8M4Ea0+GMIlRuqZCayFJcQ+qWNB0UKv3RE+kvfT7uPPPznIqB57ZvEq8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773813; c=relaxed/simple;
	bh=o8NAXCaejWiw+zFwI0Jwj0x24KAK8eSxxcsJHf9XluM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6pBfdzGDG4LMqOH8QMyJ2iM1eIYmndmyuixcrghE4k7aaWGQIxdZmav36RytF0eftmlCCpPZ5xo3b4e8q+M+WEGM5yke+bmnEJqDg8W2S85qPq+7cv8o79WVwrbFiYetj4VY+hbB5usLL15Y0lUsodChlIQzth0z1vjwq58v+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvVEJj5T; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvVEJj5T"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb73621fcso121933466b.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773810; x=1756378610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cqZj81I2CiiZ0Kzalw4lV9uG5vvjnDT/qAPEKbzCHA=;
        b=IvVEJj5TT7VU1bVt28X8bu/JUVXqDSQDGP5jhPFPq1uWQugf8WR2i9qMHFbQojPUUe
         M816kbG96jKd2hHobePotqXI1VJECGE9Jik3gyZzeOcrD4kvIbYNluZ213IgeryGjcqj
         eIO91qFQkwpsu4FxqUw+UPnFlExbT1p6Oji4utXALwT8+XoZK07ENswfoy0MxwIU751X
         vVavnTcn0hmGeKL+qX7o+sYcH1aQJDfQdvF8ogZjmusdJosL0a+uekvXYMcaW6NESz9e
         CX4QB08nkZhgRy+5JaHaNMke3bkwCJPvnBVHanLUDSztWb4ER6hBypLFZ/e6CacabMpE
         aR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773810; x=1756378610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cqZj81I2CiiZ0Kzalw4lV9uG5vvjnDT/qAPEKbzCHA=;
        b=ZyIVJYf6h6hipswNRumyD8tyrS5B3QQzb/Hrxb8yAN1WzB3yPCFgRExJ9RnukIRXUi
         olDc9Vz0DGfbGKjGro9rzjCYnHjyFiKzathtqDHc3HmtcnavqTLprdDOaa1TG6wXbTYy
         O/GTYal+xS7G/VtVRI6BWJ11p97UoQW+jJKcoR8yq2/9v96FK8CgukUXOA49Z5nqd3Hr
         d9s8KvrWyZYrNCYYdNbXcPkbvp0RtncHR1YcasK8fsXkZyEGwWXdwOTbu20hnsjsO9Ht
         whwCh1kGnn9YP1qIr526vEfCZasQHQuTAKAdFAbyhwDyT2tGMv2SzxcjsBN9eRLj7iFo
         ZfuA==
X-Forwarded-Encrypted: i=1; AJvYcCWTvxA0KXSGiJ5dJIXO1bmiLze/HssDcRcXVv98qCIVHsbntYNTNl5rnCsKWO/YZGkHpCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWcTZCq0R8kYePgQdOXy1Y7G91T4FjBOn3rHG3SsxirO4y1TGm
	Fubp3BQvcHJS0XVsiBZ9J8ijPeWhc9IQFUNwX7Q1Ufu49qnMqLsS6tVW
X-Gm-Gg: ASbGncsARjkaLzM8+zhdog+UFtHXfLNE96b6Ay7PL6Bhgu5ZSti6YQxIyNS3VCp8sl4
	gucBxyJ0GAGh4wsGg5YUfW1Y599Dpp0WUkBv64QR6ewJiKSA5u1Dn2FntPXiptft53zE20Ve9yt
	84ay7THxsdztbWm6l9j4ZrMTT1/Iq5ltzIX6wmLVEgOZTk80rb+gTCMk4vuJyjDdt3kG3H2N5F+
	BnK2qPTD3c0cN4P5c+RPRctrVFYTsCrT3qkCEU5czKClBtBXX7Eg9pf6/58wD0/mqd1WbofTBP4
	YuCwws/VqJrX1P2QMQqGtAyvgpWuuxaOzP/U1sI6ABEZVXSSiidT6NjRuP8Pd+QAmGSJxP+mfJW
	dFbvZPEepKT3NsgLjwfcxEJqJqgbzPvAMZ1+QqFbXxk/NGwm7x2lOzhgB7lD3x5c=
X-Google-Smtp-Source: AGHT+IGiQ6nnY2TbUKJoHVKQI8O3PuXhA0dGXV3weWAMnEObF/hJ5WdKCmczbq2+Q1oqR6D9+xs5aQ==
X-Received: by 2002:a17:907:3dac:b0:af9:84f4:6242 with SMTP id a640c23a62f3a-afe07c19686mr167470166b.47.1755773809529;
        Thu, 21 Aug 2025 03:56:49 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:49 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Thu, 21 Aug 2025 13:56:32 +0300
Message-ID: <20250821105634.1893-3-laurentiumihalcea111@gmail.com>
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

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338e..b62bb821cf61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1396,12 +1396,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1

