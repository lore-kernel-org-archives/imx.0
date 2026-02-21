Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42C227603F
	for <imx@lists.linux.dev>; Sat, 21 Feb 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771675380; cv=none; b=CV4F7YORqe574gnSNj6QAT5fnDqpkzRuWbfBT56x5tg9K99QMVz/K1C+wgwUJdd69zQihEyLjhObT4Nh5cbvcPGR3EE5Iw4OOnJJ2HmaLymC+SkPvoWIlcNxOsf7IzT+y9hDBsPcXRY098wkFp90FocgKIsc3cZTgg6cy0nRG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771675380; c=relaxed/simple;
	bh=+P2UmjjMj8fB1fckTddWUiRUs1ZIOtQl89FyWQY/oVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUshEdrZ+ad42+Hdg75QOTKTMIK4nCYzTLp7XZlQKXbWgAgr7TTBG4NlTMiRnWJpJqXir4kT1bMoJqOwvjAvldUNLfnRMd8scUAi9wNlr9SNsaZ21r7JY4yC9HIQEUs840U5Ezv8RbBRW4J5BQJpgqqhIUZ4FM4iuMsRORUtKzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=eWHiGQtt; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="eWHiGQtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771675371; bh=+P2UmjjMj8fB1fckTddWUiRUs1ZIOtQl89FyWQY/oVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eWHiGQttCqab0qbtNV3yYZ1r1hoiCRUjfyPQO8phOKwMB7IV/jc+EDV8LvQT2XUB3
	 nlIXcVEZO6Up1q3hCweUTcfewqPSWR9ZG/kL8f3H1SGJ7VxGHlgihmpI5rrWniZMr3
	 PcULoXr8Ulz+vrjyPHvsLPePAnR6Biaz0OeNn23aZwCNxZTTQsYR7/emxtsnpmoZ/T
	 Sr27UrsQGucxgt1t9aF2sIlkRol33ykTwTgtjEJOoMJYIux7egD8rKCKTzxdQ4eyq7
	 DEd0Wd6yLe9ERObuGEWvw5p01NINxhcUu3saXyjrN1MwebaJU3WT8Jd4qDIm+84stW
	 Dp2YdKSVqoRAA==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id BECED1F6B9;
	Sat, 21 Feb 2026 04:02:50 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 21 Feb 2026 13:02:11 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage
 up to 0.85V
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260221-l5-voltages-v1-2-daa8aeedc86c@puri.sm>
References: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
In-Reply-To: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=+P2UmjjMj8fB1fckTddWUiRUs1ZIOtQl89FyWQY/oVY=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmZ7ocu5Hw1ObhHncLNhbzM94h2d1o9vFmz51o
 jRa7deANWqJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZme6AAKCRDo8jXPO9vD
 /yxdEACIASgj/eqaCUoHUUJzgkjBpEivCs37Kdd01+sc29Bl+YonBOPk6H4EbPdGU4BV4EQ6Enl
 GWpdyORS+rq0II85RUlrSmWIFe1Gur3wYUJ5Xe0Lrh/o8EQN5j+LcmGXTmn1zdq2gSCnUAsTob9
 ABXMB/QmwIAtCU0J41vTUwPEOD6eSa7X/exEnppChB7o4i8mF/s3QgeRnkliCBmfjpvY6HjnU8t
 kZDGO/VqlBMVpGCrOY6ibPjKtJb0hEjTwv+/6aBXGIdSVuDz2/uHrQQ64/iMMZqzzedz0L/Fo8g
 dSe7w6wy9/xZeHUnqdxIGD7RicQII/SY6cPxIOc9wNW7fcrPxU2XQiRT/TY6n7H0BFG+5myMZi/
 nGZl9VoX7Z22MTF9hr+mBM0ffV1CBkCtpPwnaZUvPep/aY6HnkFzDK+WMnzi/whoIXaeHQfY1wS
 RoypWrai/39O5MI2ReOi79roXVCLLwNd+voju6RYtDuvwLcqU6LJw9MeuQMszFApD0UsqeXXzW4
 QXcZZKin7KfFP/q1WeJbcWrGG9QKFWGenJyqLwaB5/e5cdVEHUqOHWu/AOybT2WnXr/40zfVpXS
 vqtthF/nEI6cf0omWhs3Pe+4R6e5UbRsl2MzWJEzBrYqyw4iOCLth2OhBj+4Wbe/tUhKokEpI34
 JbaFM0Jw+nxV+KA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF

The minimal voltage of VDD_SOC sourced from BUCK1 is 0.81V, which
is the currently set value. However, BD71837 only guarantees accuracy
of ±0.01V, and this still doesn't factor other reasons for actual
voltage to slightly drop in, resulting in the possibility of running
out of the operational range.

Bump the voltage up to 0.85V, which should give enough headroom.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 7818d84f25a7..f5d529c5baf3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -882,7 +882,7 @@ buck1_reg: BUCK1 {
 				regulator-ramp-delay = <1250>;
 				rohm,dvs-run-voltage = <900000>;
 				rohm,dvs-idle-voltage = <850000>;
-				rohm,dvs-suspend-voltage = <810000>;
+				rohm,dvs-suspend-voltage = <850000>;
 				regulator-always-on;
 			};
 

-- 
2.53.0

