Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A14C6E
	for <imx@lists.linux.dev>; Fri, 12 Apr 2024 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712958912; cv=none; b=ALc9F5zBFhrfDOy3qhBcOzf6TvPSFNOwHcJlF9T7Bqjs0gTf+ADiU4JSeHQpQ7oix1fDZ+GALDQN1REopXZw3D7IOYRZZ9OEBmJBBbkY13vY9znmAEOkMZKBBOLxx76yXpYiFGB8tQMruVCAKkul5xr6CLiVZBHnzC4T0ZS8SKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712958912; c=relaxed/simple;
	bh=j+dx12Sgq2Lvev97h6Qd6qlAiS2asLXkAjTKmm/MOZI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lh2OGwolv9nawT5VoyV9Xj9FKV4KOZA9YoEx/dfxLTZDWWvXvFZaXJVha637aFZhFNA4ahbQtzQTSVLbf74HGxbPAnn3UislfVTKdSjL2HLSQHsfHCqaAN4iCVpDRdAudHE0v+jWAY2n0tAbhUNCIKG5JyVdINukh3zZhAHF184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ZEaAoGsd; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZEaAoGsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1712958883; x=1713563683; i=wahrenst@gmx.net;
	bh=pG4RBg1hqJd1U/4sIu7eqduCuTwGc+IuYwbf+pXqEPI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZEaAoGsdhCew6ocZmvYDvKyLaJhtH8Rg59JCXpsfIQsUT9iH2Lw7uspK+SnJhBsj
	 6ue5NndGImpJgNrXXte4RboCzwPV+YE8sjIu8gd5Sj3C2q2kEYtCVzgHxG0X8ozmT
	 c87jzmTkyS+cYy0aw/6tnMEHU8qyYCrPb57H2SIjxaAgUPqGD8XNOIYT1yUifm0EA
	 1Lg8HkxMamw18CZBX4ljrfhMdyfUOupNVaCE7WoL7KR+vlESNkzZhAX32BVn04RDq
	 Zf4yJqlEwcvJRxEgYwd2MNxuzUHhEdGFuGkQNxYLvhFDaoX9x6Mi8bzcyXlv4kRvt
	 2tYxUAUI3SSF7qs0ZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1s9mTv0VaW-00N72i; Fri, 12
 Apr 2024 23:54:43 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] irqchip/mxs: Declare icoll_handle_irq() as static
Date: Fri, 12 Apr 2024 23:53:34 +0200
Message-Id: <20240412215334.33946-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nbr/dzf54h1WDB87TDLSsvt9UmMAC4pLjgXDDG/v8fTFsA+87Sy
 W7UsOhjjH+6IDEc+YfjBLkliaf4lmoMeUtqobI2ZDhvfWf84Y9LIKl6/BBq3haZWHuYsVYt
 DUWYJFTo1nB05js+O5niUgYAJ+RjkOnCyoEUp8Rs3OmZpgVTTJ9AXy1/kEeoIYz2Rw4O8pw
 oFNDCcZ0eTlm3BKdJiLtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ok7pfGcdB1I=;VN3Em8eZQZ9Vj8d3zHCWm3TQHMY
 zf95W32dFP2jIJ/0JYGDeJt7Z+cGYPYNu0oELaNjF2o5MHWJY4Tsj7Wyw1DZ11PqKJCddhAYw
 c2w/Y9jK+iG6HcXKNvq3Ty3fWyklwDfslXe8KVnN1vHsdHqwtUQQi//TT3YxPIqopPE+flxYW
 ndxEdP7ZxGK0UwrJxJxe4KdjFB/4k+1vpYmBBfYN0nlQi5+eZT3EINZhEvd6cipMrOGr2NBUT
 DxsGjScMrAIOjcyMQwIidDAlC9rbVHNCpIt+u/7kQw9OwcZfglRpoXwJ34Ll/Q+BogwsThQfG
 On0hVwkMAPmzjTO+eAF/HHe49AXvfbVeuiPUvrPb2ySlNPws6SLDcDKGO9mWw60phS8ydTNpU
 pJtjvokLrfcvfefaREF1aqOqYXj5VWdarQchwATaZ2HYmq7PyQWshtwuU9XOLqTn2LVOtRQIe
 zr/q1E7SD1aqNxCiht0wxE1w0lyN0UmL2xzi6qGJjRHn3+n2j/1GoTEyR7zJTpEM6v3xy1/sk
 lvZR6p5fP6HqZKEXfLl59Din4GQQUAIcySf/MHftVOUbkzexDvRYe/CcbPN5wHPXVn8fS5kyT
 6hWCJML0tDZlPBpXfwYmIdF9QIDx4/zRsvoj7pLVaV/dC2hqh+Ols7gTGdIsTQyAwffwy9WxM
 DjCVp0PK6lzUqvZmgCFCxgY4qQCWc5iTOohM9zCUvyHOePXmyDkzGbZlIShP+EaNhbWCnRKlP
 SVJLG2T+Cr+2t01gm9mCwJZMaOCpmY9IDIbtXLYaLwfVXsFQ/7JYl9v1lKJr2+iMjDfn3NWr1
 3x+cbAVH1WGdYWwO630ogcYKwo02vQLhTE3dteyqPKGaU=

After commit 5bb578a0c1b8 ("ARM: 9298/1: Drop custom mdesc->handle_irq()")
the function icoll_handle_irq() is only defined within irq-mxs.c .
So declare it as static to fix the warning about a missing prototype when
building with W=3D1.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/irqchip/irq-mxs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mxs.c b/drivers/irqchip/irq-mxs.c
index be9680645545..19fc0bac76bf 100644
=2D-- a/drivers/irqchip/irq-mxs.c
+++ b/drivers/irqchip/irq-mxs.c
@@ -130,7 +130,7 @@ static struct irq_chip asm9260_icoll_chip =3D {
 		 IRQCHIP_SKIP_SET_WAKE,
 };

-asmlinkage void __exception_irq_entry icoll_handle_irq(struct pt_regs *re=
gs)
+static asmlinkage void __exception_irq_entry icoll_handle_irq(struct pt_r=
egs *regs)
 {
 	u32 irqnr;

=2D-
2.34.1

