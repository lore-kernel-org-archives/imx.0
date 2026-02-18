Received: from mx-relay154-hz1.antispameurope.com (mx-relay154-hz1.antispameurope.com [94.100.133.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C512D0C9D
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421045; cv=pass; b=jI5HEbCdhWeVrAiV9e7zRLkGSy1fyBDL1hh/1fk/nA3EnLSvzAquKvxSwhIVqL99Xx887Lfz9PpYPJfZeVfRQbsPq6J9Kni5lFXAIh6RkpP89hNOQ/vcfkDGptguQEKCUxI2aRk8iVjto/9bbOmALGbi7nEgE+yXNClB2PSCjHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421045; c=relaxed/simple;
	bh=UlU8u45N+iRUHhs+x+q8Eg58og+sPs+uhkmSpDxADd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syVJFK3Eqr4e55uNugXM31U4uAKXBG4VHzuPEpq5XqHIWzOWAg+rg1bUXv6oJoE/QF9wMC9PGJ2jxypVjUg2kv2zX//sCPQqsKxYGAq+bADgmunLwkYyXAwkqzfCWy1Em7+acnGKjlgIlzl3dMJlwsg1YOls+FZ5e8zhRqaEXB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=o0UBXd+n; arc=pass smtp.client-ip=94.100.133.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="o0UBXd+n"
ARC-Authentication-Results: i=1; mx-gate154-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Xp6NT0DBPlQZavb5HOX3AnM891/YuQXLWauhDrKKecs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421003;
 b=GARNRs1huRxsY4KwxLlr0uHE27b8yYFc9f0bKjnrHk622KufN4LIvwnmw3VA2UUOi/Y/kCQ/
 7KhOpPzL3OTydhAkMgErSQX/gszG3y3ZEd+mt+O8IDv7obcaHGH0plMKyGqDQnslDIyDG62PyZW
 yMZTgmVk6tbyKPY0DIHAyoyerJyF+rdM5twKPekVFnUqIVtz6jr/yJXGcQ5Ibml3uXKAmHEKkF8
 ZkAWCFbZ8XypSDCkkfs0nutAUDDJlOlmpc+RA1Wdq7l3ZBlnxaz9sR2h8CiyOAHwMaV3qUNLrRT
 wwVxzXSfi4Kuj4EymL+P14c25Pui63vzc38DXwpo83xXg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421003;
 b=Q+Lfs3uLTPBec5K0FywTQn0i8ywp/MAOZzVprLQA3JoMRwg1g5N/96FIidB36ldQTjxolA6u
 nVcMVMxJjSLgTuf28vTDkPNl70gtVuAb2MUxb7JcPb03NN4wPly2Z12htgxVf1j28msyX81hvYq
 nzHWPYbYLYyCqvZxp+Or2j+yz8jcSfLvWS5LQOs5sstYvOWTusVGDb1sIMk9ALCAl7uz/l0vY9r
 dOuh3+2Ax4TmBbh8d2xKsqScqYK7buqp8j77rlBxAYzSURLJYMo/x/zVjXA/91xw0Nl9PFt6qWH
 ZyxEVrJubTXm3f0hCSyobDO6oaOSrqIr21AL3cnSxq45g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay154-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:23:22 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1A25FCC0CB7;
	Wed, 18 Feb 2026 14:23:11 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: TQMa6: modify for use in bootloaders
Date: Wed, 18 Feb 2026 14:22:21 +0100
Message-ID: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay154-hz1.antispameurope.com with 4fGHJH68KVz3K5Dn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:c9bad0062c84e180e2c681c5257030e8
X-cloud-security:scantime:2.185
DKIM-Signature: a=rsa-sha256;
 bh=Xp6NT0DBPlQZavb5HOX3AnM891/YuQXLWauhDrKKecs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421002; v=1;
 b=o0UBXd+ni+DF2AdmK+ndhVUzEV9wLrTpM3HIvufs98PvA08iGOkV3FDYm9P8vIceIUfjbyGh
 kFR3GLFV0t8uaT5svwG8YVP4Uwlmb2Jpk0xq0VAIuEvGIs/7x2ch72Dkbh2w9zcRkEhVI4I/CCP
 A9IdY28m6rPXxtaOMZweJQaLnfXsnNnTtDY/3E+J2LFXKqhls04/7vv2rBsj88KHzmwF1Vvb4Jj
 u7HukyO4ky9UkIUTKJH13G4/zb9q7VJVc6KgS7HyIc8yjHWk+WzHdg+uodwUsCH+W9pTTe4Y+nt
 jq+BE3AxXNu53BZOwSlRxPu72ZQ0soc/9t4On5+1DDFYQ==

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Max Merchel (4):
  ARM: dts: imx6qdl-tqma6: add missing labels
  ARM: dts: imx6qdl: add boot phase properties
  ARM: dts: imx6qdl-tqma6: add boot phase properties
  ARM: dts: imx6qdl-mba6: add boot phase properties

 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
 5 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.43.0

