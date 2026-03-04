Received: from mx-relay48-hz3.antispameurope.com (mx-relay48-hz3.antispameurope.com [94.100.134.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541873AE197
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.237
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635484; cv=pass; b=kgQWAaDomszuQaKe1WEewRbDROTTt39a/nCkE6e2ePn6Sys6pQ0pj71p2+bKUKOYJo/if545xIRR5MLfiZVh3+9G2MABN1BYfDGlSYlH4JdPqdqy/9AWp3Jy43xHZ9IFnBvsL91fdwoH6T+qQ/yMirWX1VhK0+t+GjCB+bi2TS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635484; c=relaxed/simple;
	bh=uSYPPzoQXwtgzllj7nCJ5UMmWzV20ok9q5IZDWsVJsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HirhEJzjveVsTMMFeEldNhyDVeP2Zdz8xb21Dzft7oOmrHlOo+UtBAVv1LLcFRSghmEwbCr5WgrwNDlsmd1JQ16nd/UY6SmdmwcZNuRRI0RAlEO3bx0y6fYOPw1iKvFe0RfBciOCz1u2mu87WF0pDg/yX3LcKk9BKtCiFXqszN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GetcJFJz; arc=pass smtp.client-ip=94.100.134.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GetcJFJz"
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=K5yLYRXzdU5gOCN9aGnfkC8o/Vg0boBnlHfbls4yZuc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772635471;
 b=E3w90NopD2BMmuJUCNbBDKzBsVTewnnhtFlbaTUz+3KGwU73wQ0f6GQLbqg5EMRguhNLmdKn
 dbR4JkLKlhFPCND8YJbK8/AEf+lq3l20Q7ougemqs6vw9zakuPfjzZghOg85iGzE3obzsNf2C/2
 htsPSTjznBY1DqKZz++nrgSnubc3MP3Lohb6fyJm2kct+rH6j9W+O9zBSpAUKJ2WANOCH25qcia
 D8lUl9BGV61950/mmYuPLqIB/HYTT831M9c7Z3dLZdmm9iWdcEJfeCnqJbyL5aTron9hrVvbkM5
 X8s9Mg7q95fhPx5tJfj2tRB1q+8pgmJQxXXTi2K2Qx1kQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772635471;
 b=j72DkI4nKmLMCxDxpXVQGsbQYIZcOcLwqhQgn66GsgAQl22tIdGexGTfx2JTFwSQYQhwxHWI
 f3rF2xYV8paqoHTHUPwrbi6ORcyUAoLdv1K26g9gxFcFTRf8d0nj8LKgZMu674tKc9lQOEF5c+o
 2LNL8OaElRhQOzwTKGvkmLJf5yxssDBSimoD7J/+qPhfsmVE4JfH0DIVbbMpQFn4HwI2aiAznuA
 dCMvSktnzVVmk1o0G8qA3D/QWZCWGFO8qOosL8v3DwX/auLndfDwDNn4Qqlwo7weMg7Do2YpJJF
 mPn/2gHsjX4yvNi3fawJPAgYy6OEhSAcaXUmFxm8P8SYg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Wed, 04 Mar 2026 15:44:31 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 79CA3220490;
	Wed,  4 Mar 2026 15:44:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-kernel@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] MAINTAINERS: Add i.MX team to all arm NXP platforms
Date: Wed,  4 Mar 2026 15:44:22 +0100
Message-ID: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4fQwRY5lzHz1kNt49
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:0915c0a863e913da438056391d14150e
X-cloud-security:scantime:1.602
DKIM-Signature: a=rsa-sha256;
 bh=K5yLYRXzdU5gOCN9aGnfkC8o/Vg0boBnlHfbls4yZuc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772635470; v=1;
 b=GetcJFJzuHpwsMyg3Bm3FH/B6AAPkqKsNKA7MfuCAHSYgrE5b1wWkq+IYPHnMEVN84MqN8nL
 l8doRAplNNjo+9PoEeZERV1R3Wjh5rTk5TdR2u6utO7K84gVSS1ZrGIFajXjkzQQdOv45epK70l
 t/7byD6wIrOx9+QjV02R4dMF665adyrSLKgR88WlLBopG/AEw+eRIiWAvScp11skfX34kM+wRxV
 6EVAqR9DChudqiykQnLROmRCYmAWKoBRxccf9v/KRXp++5PO+r/3fc84cJW9ImjdIX/nlx4An3R
 na361Js4tPexcLFNxk7JItHlJIZ8571uw6VCeptwTr0QA==

i.MX team maintains layerscape as well, so add the whole
arch/arm/boot/dts/nxp directory as requested in [1].

[1] https://lore.kernel.org/all/Z+Vs+pHZs2fMP%2Fp3@lizhi-Precision-Tower-5810/
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
* Rebased to next-20260303

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 467fc9dab9801..315ca1e1821a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2815,8 +2815,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	Documentation/devicetree/bindings/firmware/fsl*
 F:	Documentation/devicetree/bindings/firmware/nxp*
-F:	arch/arm/boot/dts/nxp/imx/
-F:	arch/arm/boot/dts/nxp/mxs/
+F:	arch/arm/boot/dts/nxp/
 F:	arch/arm64/boot/dts/freescale/
 X:	Documentation/devicetree/bindings/media/i2c/
 X:	arch/arm64/boot/dts/freescale/fsl-*
-- 
2.43.0

