Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894D221FDB
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737674; cv=none; b=KXhEkmM+gHSMIq+8ZcIbVWI7mJpwi4eOoYQQytVGWken/N4+HhUjh3rCtraJwaYfGFVKJmzBD/59O6Lc4/+3Y/cncX4cWUjiMlUWUnIDJgp/5TpwPdxDW9k+SZxGxBcIvk7EOhFQJR6j6VhabmsPysk/HzoxL8A/RNjBveLQTAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737674; c=relaxed/simple;
	bh=NfgaXQBvNUUvr0jFlV9J8eVtkLOh24tR5qYNGiYdAo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fzpnmsHT3MiVxvjvwcJBl2yjGODBEGRubWlUSyOe0IaRPJdt6UFLPvy0qCt5bvuo6j+y5kubBk4DdFDUY8yTgIu0iKbDqpaTU1mrIP+y9MQJWjTZ4O1O+/oE+QFnCtUiUAD3re/ugfGwtfZzxASgW7doJxItkVrR0dme9QfsQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sdw6uIJ2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sdw6uIJ2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso64237325e9.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737671; x=1745342471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=;
        b=Sdw6uIJ27dbApNkV01mgGqG/23HxUbNb/zvbJuLWBhY5yWomYb3CQmKkcpq7SBEihb
         LLeOrK4w8UUtAq6Enoqxe8wTc4fwZAvDZWBejiq4sQDYs2FYKIRGLFU+fUfwkgF/Qks+
         gw8pdQAglWWqSqvtQLCUUDbV8ClP7oXNK9VtMRizxIhj6anYqXqLFe9TCSFW/I2SVMgU
         Mg6z/dDa9APpDd5fi/5JDVAmGw2BpKxiOhQR7g8edV2F0Zy/xlXJZUrEBodj21Hmro8m
         w3L8e+doQw9ZwPle8N1G58Wv1r6448W0ffbgb2F33seMpnUhri0AebEJhcabyDdC3LLj
         Dj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737671; x=1745342471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=;
        b=vdkF7ThOLoKwRw7q9CXF7rCrNXWovV/xHttL/PNpqzG9Qw0R8gmDAOr6CTbBDpaiy5
         nOxt9uXYnSINNcG97qHttfRjX9xKZFZHGP4O+S4HjRr/1wD8LWfqnJWD/s0zWX4lMiua
         LwOZiF88RPad9Hq1c9eJ6svOQyAwj0w5glVLbgY1klSz4AnKnHgc3nm1DTMSOyR6P+3t
         vkF2LUFexZU3ALyGqKy05ZdNptz96xRDHofixnZFaMV09Rh58h4Bmn9wtDps5vrKHex/
         EQIUh9louqJFuewq8lNUhw8pJS1/fUKAj0nn9rNQS/2GGYLmBNBXXs1QkMU8nRe7ibEa
         cI8w==
X-Forwarded-Encrypted: i=1; AJvYcCU5TpFBh6J3zvEhRhrz087kHHreBfUjCSO8qZf+uPAMVxxQIktMBT4z2wmLS/VxGVOCdvY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBN8P92UmCWG8I62XWZ68hCSuptflSl1kik7ruBwf0OSD6TW5o
	QVtpgIzYDwKni/HeSRyAT0jfcBdR2VPQjqgELLSAKQO/9hVVliSn
X-Gm-Gg: ASbGncsHeBP2F3M+x6fI+CeSeYSL8kgvUYifB9pFYRhjEH8U42/3PdZixqIcflGEe+Z
	gGQ0YaMQIH2n7iYBc/SO9IVXJkHhgN0RRuIQ+tvvLevpKqbl9s/T6W4ZeWQ+c56LQpBVW8lTib7
	Gvn0d3AdvLdYN3S05LFiWxnmUQ9Eve1wgjqHU9+2+aVLjvEvUBejyZxLPuW0YSjDIMyCFLSKgbG
	lLGOtr86HvJssOweBs/jedzerKova7mq2caPaoK49PvmLCaG3gA/567/bsD0pR/mRogvbEHKehD
	Ae0/ReAO52KK40IRp3+VZdWnL4xnrh6EMHyQhM3QeMwDEW51I4VHlfSPim9NhwkfyrzYi0eEbtx
	ep8w=
X-Google-Smtp-Source: AGHT+IHmlSKDjijdhVP4MsrrIOmDn69e4RJTHJc1yap6d2BaTmoYqDqW9yK+cYJfmW31Obrp3rSSKA==
X-Received: by 2002:a05:6000:4310:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39ee27632c2mr255465f8f.43.1744737671070;
        Tue, 15 Apr 2025 10:21:11 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 15 Apr 2025 13:19:19 -0400
Message-Id: <20250415171919.5623-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..d0d24fe92c3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,11 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

