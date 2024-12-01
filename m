Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E11D959B
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075251; cv=none; b=np8ShP8mbBq0+AboLuuzijbvlM1Sxa8T9OF7nD3NlU/8zsigdtBHbO69UnZjujiBMIXSnD4PpBqfCnfFvkZrSx1ZOwsIRWm5ILaIv4Xk9N2IqX2/56wiwHjTqOrpDo5IwNkih9mtN8Gqn/2q1UZdIXpJX1SPAqrownUVwaCniVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075251; c=relaxed/simple;
	bh=Ac4blgYWf7CVzjbS2BlFj/S4aCoc/+2YA3/WYpgya9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ho13cHpxpUmR1FLBSxPGPlhktGWwvRzdnICbdJZhcqgDF6oSonN9dd7LXugEhMHsoEfiWFqLLSRBjrnirFe9TsnNjuV3FA8onwTcVq9vr6HUSL98B5EIej3Yz2ekKvp2O2YXLl5BQq6o5/07AJxhXXvUxJjazp/+h/Kh6p7U7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LIGkEuTZ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LIGkEuTZ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso464535866b.1
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075248; x=1733680048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYgi3gWsFZ6bxt2QyzESPfQwAyIPmeSWspE8fxXg91M=;
        b=LIGkEuTZEoDx/rHuG3o6dGE8Qq4ck4tfTjw+p9G/s+UBAHtU9rCYsnfBr/XwyCfC/X
         kdiP456LKTpUi3rS8A31+gCQquf8X+R2/sW/UNImfCex6sqtcPSjNhA0UK/4YsyJkO0C
         anJ2sGvU0os9sWzYnCjY/KeonoZn/EbgMY+Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075248; x=1733680048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYgi3gWsFZ6bxt2QyzESPfQwAyIPmeSWspE8fxXg91M=;
        b=G7xf+9GTGGlmt9XhoIkKPTIhXlf/XSvYT4bHHev/EBS9pcA3zMoWUS8DcVVEcjq3xf
         1l/dlvW53bSni9TBF69ogkd+c9g+6gg8UP8oGT35Bf5UXYuPC6bs1QVg03HM47ZRhIv2
         vSJoys71t2+sidogcn+sBC0bw1n6BSY8a7AMwUjVtiJY3WA3N5D4ytX71YIRCzUNdz51
         DC6nNiJj8v9+QXZsk1tH6waB7SX0WgaSnsXgtQKlUQiU6ZjfO4c9KF99biw6WpSZrvNI
         nyZc9DHWgoKFESRuaa/plHsQQWMtPgzqMbkRwMBGZp0x5s7vT7MS3ujVfnNa3cbRhp0u
         CO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUe8lySYsuhP7sqevajJBdOhZ979E/WUFg0aECRqJRenY3wlah5Qe0cIh87m+OT9furRdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YySRzTfm4iR++wtN7i9L+ewEpphf2si/M258ECxhJhDsCVdendg
	uTJ2OI4+ek4NUL+umvyTmuXasyjjlYpqX8Ks8p2+jwwBqwNWQXb+U5DRSVNsfc4=
X-Gm-Gg: ASbGnct4T0njS7jVowquhtOxK5mHVcWvKuhMRZ250gylrydVtYYabJqGXMO2p3t9vzp
	fpCABgZnXtuI48IuYlcZjx7Hw8v+HVD9BGqW5R9CC8MPyJdHudgaJUAgn1v9rZtiq/azOi8TmMB
	mb94K288ULWC4u3Nvl7MU1FNIL+GOGXW7AhcdEfDVOjWngNR7wzrv2lFvJFsisoV8NLyXjy//w3
	fl1TbD+8O3irH6J8ST9ejXmHliuH6lPc/Spm3eQ2v6GFl9qerzDzbu40ccxiIswxiCCpr2MWfpK
	vUwsSeHmyE8xQrb/Ru4jQB34SbE3ZPUenIWse1iEfkQo2b+qdefuOzc+cdvDFwVC64YBeCmp7mu
	3yLYsstiteO890wm/
X-Google-Smtp-Source: AGHT+IFEnqfNEU+rcacBAMtddOncowvVosTxbTcww82LB9zIQkVF6gwcSPLsVyk8WzQcN3keRGes3Q==
X-Received: by 2002:a17:906:2932:b0:aa5:396a:c9e8 with SMTP id a640c23a62f3a-aa580f27899mr1226207466b.23.1733075248682;
        Sun, 01 Dec 2024 09:47:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 06/18] arm64: dts: imx8mp: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:06 +0100
Message-ID: <20241201174639.742000-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

