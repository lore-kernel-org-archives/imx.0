Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F298323F40C
	for <imx@lists.linux.dev>; Wed, 21 May 2025 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819714; cv=none; b=KfLPY7aVZV4L2txOMSDyD2BMxCIWhyN2HZJDeZcMCKespaudz5RQwHFllIucaMVxDifobh5SGZXhKlPM1h6A3DlGtDRC877PFjTQ224eLWJuYAvAYNwppZtOkjyW+hmyYWqnmmU+bFOtBQ5U3XMqfyU9b/qUUPy8VOlNAas/9W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819714; c=relaxed/simple;
	bh=FKD70PE5Epxp3lEHLPKpUCel+rzHcrPmnKbb2/plsmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppuDDEXrLrPJnEL2h+n86QqmdNYMj4YxZNfT57WaZHJYSlofgeopnY8uexBapQziz0bH0pLvNymS3BEcS5Dbu88WhnZZca/7GpGqB/ni44szmv9IeoO8gAfzIyYxRtGIcXszF/UA4tpT9CMjK+6iF7rD0sdQH8K8dnAdarbJk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=c2lc/Q8y; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="c2lc/Q8y"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso11844139a12.3
        for <imx@lists.linux.dev>; Wed, 21 May 2025 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819711; x=1748424511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=;
        b=c2lc/Q8yZ2q2zlw+rdgSsdvlqDQ7PP8+Sv2m1B2Njm8m2TvGd9Mz0cNbzfPMfIOxjT
         qrqvbl/xP+SCPR0rhEmUtVuWW/eyd1Ha6rbDbn1Gh1oZea6/Q7fpUSSD5nnwa2NqnGVh
         wy30ivjABCqZmVqjjxJsVVD3Ql3uhvUtlHamU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819711; x=1748424511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4ZKx8OEuhG5n3iA9Ht1qjJNqikHTEvlSRpqNyHprtI=;
        b=C+UJ1JbgFDeyOiNCIXn96V7TuD+CJ/6xkk6JWHvhftxDzAJ46xcumf1/A11BppVXCg
         3Vbzuro77iPEc0NaS50DhcQP6HCmwvDvSxSHAEWn5ib9t/vPaVhDfpEOF2YBOeFtqMfv
         L/oqsewpMXamODqSOZSOVFiQ5j529N2LDXrqoN6qHxG6Vefm+/srg+oazsY2ii7YW5RJ
         FZ//O2CsHDlQdv2egOWdze+HKPETVM2DBvvefUhhdFqU+5FIgnxb5U/IMOQ+SiBwm138
         qtxphEWT2SB8BKYPAc/Mcn5DqoNMYqIRJzxWyk2AqR5FGOl1mNawvasQWr810FnmfU64
         DVgA==
X-Forwarded-Encrypted: i=1; AJvYcCXfJYmcwoit6TSc7dGXJ+DHu0h9xUuTz99XcvWftIjosHbw1tEyA32I85hktX/maxkyVjk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2rRPwXGfX4dOj4tnJ+dZAYvThS6VLc+O2pAbJPEZoAPPPaHg5
	AztgAsdHFbYHu53JXI8IVmHfLO6EdCHmZc+0Ng1s7ccdnkDFFKucnQEOPSdv9I6OXeY=
X-Gm-Gg: ASbGncthlJ+qvQd7KJ6fjYMaXQR5NQy4epyY6jY/38UwKUbeNLtOgKW6Fzwy6oiVg8l
	wP//BpcSeRPCjB19actr31u0iFB7qRlAmebtD0SHbSQ2VzRc4toH9gf5+CcIilwZY2glx9ImV0V
	hJspMox+0pYi6MHS+9AjQ2p0k+Z2wQ5661/jSiueGi21WhyB6ssacGo1Ac9x4Tgy3uSemcFmIaX
	wZsEbFmx4vDDsbTHKd4JaTR95BitaLs7rCvV+5CIbt9p8AV741wbUbrs/d3Z4xg9+D0EaerArhY
	3+a66gK+g97O84xvz9vRD4Z68lQrpr0ayKfwL/wfilbgAlStCBjV0biGArzafoT7OlkTy7TeOda
	CGKpfb/tw8pwA
X-Google-Smtp-Source: AGHT+IFNzWiTTqQss9HBBtI+Nr/N9FAThr7Gi7sc3HVIWm4O6Gp1xrzlrO/3vjZUf5bm0cbWUM6fkQ==
X-Received: by 2002:a17:906:5582:b0:ad5:4b4e:e2f9 with SMTP id a640c23a62f3a-ad54b4ee44emr1238839666b.1.1747819711158;
        Wed, 21 May 2025 02:28:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: imx28: add pwm7 muxing options
Date: Wed, 21 May 2025 11:28:20 +0200
Message-ID: <20250521092826.1035448-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

