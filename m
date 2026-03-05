Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD2F39E6C7
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728974; cv=pass; b=RGL+sjpFxmN/OrohINfA/N8MIG1SHOc+YpZWredDkEHDMfDE+o4CozSolb7utPSApDokmCaX+vvSiYyyHdDvp5XwD4isRQrtqVAuk0WCnL/zFhPlQBGXBZBmYJOYFnB9jS+SrxKaUZGpgy59WPKlPveG1EfNXj9OKktUTVPVvag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728974; c=relaxed/simple;
	bh=tgBR+uaRfWNUR/xbu/5xWPdr0JhOP+oB90ltAZXz0F4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMzbHA3SmEo6tdCrguhmy8WjoncHMTVVIu8rP5YHiTg1+2WYdPwW/RI5VgEtJ1Hs8MChD/9/0fG5hWpknrwRt2IlcOSV8oJ77CxTHwNohB2b1rdIC66JJbthrDKNl3F9LJgJm0om+ifIZZm0Dvc2YWKwnGXSKk7D1M16+xXkh9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oOI85PNo; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oOI85PNo"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=0bisfPLoTg2XqRMiZbY8naTl0HU//YMfolzvMIjdGgk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772728956;
 b=Qd3arcETkJk1lFVjHnp+n4dVqU2F1UZQvQKjfn0nnvZ+PWdI5vq8xA0+2RYCnTzFtxGuOyA2
 wTb53+x0jjlbQifO+WwKHfmt5PIRxsXcdmlO4QsLeOPrKhMr1gT4a0OzdHKAiPMDZn7a1XZt1Uw
 f9O5dtliVkdNY/TyvZ+ajr4SwsckXUKBdeFGM6eAJ8C53Cnbky4xxHM1iginY4U2XW3Gu1SLWmc
 Qfqxeue/k7eyf00DBuqcDcBanfJ0tMYwMEr7TBReNgVA9h7g4fj/+EYjJWf8nX+Ke9gIhEyh70L
 PSWz1+fg3he82C8XT/lj3zCN92+Gg073GbBT4v7odDJVg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772728956;
 b=VZPM8M8NsfbfDJLVyKLVLz1I7zKHL5bcXxDeauUDQE65JMQtRuH3e5Rh51sTo95enLfsm9a6
 gNzIrJ/vSKu+h5n8zJqS0egONzLaZD9doay7Zz5DXxRMncdajGxmkm86fd2tB+0QhDiurdA7akg
 pmmP53uJKZ1meKHzNtTa5zuqXkJ5Y65clnoPC5h2s9toZdt6oi8eb8Ei0nadPKo7syt4fFHF0H5
 KLO3Ig4YKdnNCKPQkpAlSbOVqL0UTMkaN8xbGAPUjM/DzZt+P5k+H+ISj3c/25eh7QpqBLiRvhy
 XXe0RLMFOEDHfTfGq5Il/e0e6+d0PenMdYIHmRcY5Hf1w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 05 Mar 2026 17:42:36 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ED36ACC0D36;
	Thu,  5 Mar 2026 17:42:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx91: Fix TMU reference
Date: Thu,  5 Mar 2026 17:42:22 +0100
Message-ID: <20260305164223.2650908-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fRb1G4hfBz3yX1h
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:571ca73a620effc4570f7a8b5f908bd5
X-cloud-security:scantime:1.761
DKIM-Signature: a=rsa-sha256;
 bh=0bisfPLoTg2XqRMiZbY8naTl0HU//YMfolzvMIjdGgk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772728955; v=1;
 b=oOI85PNoAENFr81NbWDyp67ScePspKWlPRxZRVMlKivi3VCuD5pgXpmLp+Je3fKvvfXkUQcM
 fj0he6Gc6v5Ron2UtoAaAPAfW0AJbsJBfSY6yY7/MtKzJX4+qyH1gLg08cJjhLmfWAL6xUWlxYz
 9nPZqfdj6EwM/oE/F0JShPI1YqPBoxYreb8wbZ/QrcTYFUGoIqNShCEhaIjSUXblYB8QYovA6bl
 hFskF4P7sf63j719YsKRRej0vKZVc+o3p9XPsUAaj4gzbsvljS1dEEWD1DMdfCLjQ4qWDaEQrE6
 tFTjSUk4ZIeWhJlOCCXRN9bG9441ZEuLNgsZuGPBsW+Og==

Currently a sensor ID is added to the reference, but
thermal-sensor@44482000 has #thermal-sensor-cells = <0>, so parsing fails.
This also has the effect that other hwmon sensors (jc42) fail to probe.
Fix this by removing the superfluous sensor ID.

Fixes: f0ed0e844452 ("arm64: dts: imx91: Add thermal-sensor and thermal-zone support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx91.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
index f075592bfc01f..d63569b39bbc5 100644
--- a/arch/arm64/boot/dts/freescale/imx91.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
@@ -11,7 +11,7 @@ thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <2000>;
-			thermal-sensors = <&tmu 0>;
+			thermal-sensors = <&tmu>;
 
 			trips {
 				cpu_alert: cpu-alert {
-- 
2.43.0

