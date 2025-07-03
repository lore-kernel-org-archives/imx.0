Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41962D979F
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542704; cv=none; b=e1tVtBWDXKn9kKB/O4G1KW0WK/Po7Ixx1x8z7vqHPf15tPTHR+zqVfljC0yXz6eyCsznSNtVkd0awglFNqEriUDYylQBLmDaTVWhuyprPP8/XVHkUeZ8SUe7k+6m2gJHHQM31QVfIRPA2rBI6ER8t0ncvc6O85YI1+0rGlVoNa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542704; c=relaxed/simple;
	bh=T6S0lf+0PH+os9muTW99xmvjZ3xavuJO7UFZrVMAQj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hi+f66VEGcrUZoGyyYlzCamg1stODtExER8GiycOz3AIm2mpiDVQJtlsTH0hkyPoqj1eafmjyTMyDH4utJW2wIzWo3eFjhjjzijmXcVqa8AZC6fYwrSv9yzGeF/3s/wIPbCCLpDousXD2tzdDNmyfPv4TWt3jbw5lYprX97Dqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AH3K4V6c; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AH3K4V6c"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-875b52a09d1so160422839f.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751542702; x=1752147502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=;
        b=AH3K4V6cHHa/6SqNyHUoa9ML7nO6y1G3/xNlNtfwwIULTHtXbQm9+1yx1awWnYpnRj
         ct6pon71vv1n9UY6FUfV7Bqr9GOUVum5mOZxbGwxnLrdQdD03If/Hs7ev1+CW8iME9Th
         UEw8vHUHHUzKOOu3pOBDEW04nCVYAtSkbl52mISfrxYFdSaFcT8hADOc0fJBwoFVbJKa
         VBbNEJMKFx2K99fm0xcgrMB/7Bt9OmiL+rx+48KEP2FAJ5+6mNg+3qTfMUMLSnAcUTGp
         KTFnJtlISGp/JbS1FFCv/ZQY8IC2SrE6OhP/ZiI+skfRhYIjqqFtBVksBgEiDjuUSraO
         s97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542702; x=1752147502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCs3K1Nocgfdm5hTUWEMb6rRK3ZRN34oOYMrfS5yndQ=;
        b=aKGnvx6+hst3Av934K2e3QD1d8V9rH0Ws1GVXTg1I+HPsTMvK0VzvHz8WqFkOhodRE
         DAKrk1Hm4eArRbNwOYx3D+uROCpmGbVGp6V6oyp2025yIcBKZBqJnP5cGrYVb65+IS/T
         k6fwkzaCq3izqClQc61V8e+OZenjrCbPhvE+qr5N00W2LgGP2yT0NPzgdQSNDBQ0YUw5
         dTjboDtciNgqtGApjrLHzf9axh89sj9tychntnT6gtOATWcJzxpgY3qOVSI8fdIjKvp6
         w4g73zoUInuhQIX9sYqnS7WDeoExYemsYPZchoYnJpiG8KYeE+nts6J4WOrLzavBdadH
         MAqg==
X-Forwarded-Encrypted: i=1; AJvYcCUUfG7CWqA0171AKsRbjq/1JyvIWA8r5n0EEphioWzgh44GFTP5ULFgpHr5HmU8enAG8wE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxubfXzViDa7JiYjJZBLFbJB8rZI0ANX0gZr63f30i3ZsSsVE24
	zBpnXs5Fdj4qe6wqBrP7zlJO7JF9AwBCfdU0ILHMeTLILZjD+6gpBOD8
X-Gm-Gg: ASbGncudUJYsc57x3KqPiJz/Y8VeFJotERLE9kcgknxBH4kV3VbS/l8YG8hqo5Apvdc
	rVlOiFAaL0tNweR07Aqhx9on7ETowxAG8SgIo3jO7QCEwHE/aoP6wLoASYzvnJ01A0iC56tOPAC
	aKyAx0v0ZKn4XGjN9uj6tT6N/1zzHj3wQGUV2LvyW+AjNTISSUKYyN+0nO8ZNFQ2r2a5hqTITJd
	J+oXjZKKdp54Wcr/G+cBFhr7Y+Mdvex2nCfFc8tYmQHTtPxDTSF6WYfEZTUB6EilzEe5jQE0mKc
	w6jwLA5ORjkyIC/6/5fnfEDECtaZ4t3QwEf+KPFlpuXL/z8F8KZR4GXBxaJXwY9v2IHgxUOWwCu
	odA8pbeYy+xYFXSaNtA2RgAPIF09Ky+i1q7f8
X-Google-Smtp-Source: AGHT+IEAElfMxhOjH9lhImsexhBa4mz6jk1CGA5i/+dNtcBikMrBN+qolLPRqJUUtETlB6pD742Ssg==
X-Received: by 2002:a05:6e02:17c7:b0:3dd:f4d5:1c1a with SMTP id e9e14a558f8ab-3e0549f29d8mr72031885ab.17.1751542701597;
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a57456sm3483544173.72.2025.07.03.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] arm64: dts: imx8mn: Configure DMA on UART2
Date: Thu,  3 Jul 2025 06:38:10 -0500
Message-ID: <20250703113810.73023-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703113810.73023-1-aford173@gmail.com>
References: <20250703113810.73023-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recommended to not use the DMA on the
console. Because, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fix spelling errors in commit message

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee6..b98b3d0ddf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -860,6 +860,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
 						 <&clk IMX8MN_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1

