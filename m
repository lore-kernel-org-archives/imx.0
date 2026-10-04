Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1F5394EA6
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122507; cv=none; b=dpUodWQiBhUllQuCdrnu3uGkVS/hu/hGJl1z0lZfORKOGZC79N2kH5xJK4Sq8o2wKoAuW4QeJqygKXNZxx3hKswuP3EZSfTO6cF1/PCEdtPFwofn0xiafQ1M2X/c5HsWgBOn2f95y0foL/0KFBAJhPpthbDXZLOM/c8G42QoCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122507; c=relaxed/simple;
	bh=F4oGIYiE8v2ioTDCPmIs7AMx/ZHEc+hOjIor5eFOGUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miPdx0fSpWKjtKU/8mqKnBLdbHcbEIe+duUeoON9HwtjtB83R5veQjfNV4YHryhlQdPfEwKd4Wl2XK032d2xAA0p2ByLZD3/FM0CuaHxM+wkrgW82ABp78FLyXcEFsD+IsYSIm1nW3CRdnyy+pIpXaI3u0253ykDO+3ZNv+mvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LNk0Tn/4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LNk0Tn/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791122503; x=1791727303; i=wahrenst@gmx.net;
	bh=EphGX3kNeaybHXcJl/+8b+SXjD8MFMgKX/Ow3lvyu6w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LNk0Tn/4YgUOKfD/n5q2NAalJhJcf6xcUbNyvn5XjBZToIGFNmOdu6WDNcR8dJlW
	 IN5Xjq56WKgp+Wf8zDcBVMI/rLUMs1Z9dbhTj/MbGJy7LSd2MT80kndhRdJFAcAMC
	 eaOn6sQMqSep0Js5dzTl5HHf7ish5+0M72vSEDMhkS27NzxPaYH57b9dGhwj9fvZh
	 8wgNGChkIBt675+CdXdsWR59yQfQvDaFk8AD8dHBcC10yMR4BZEaI+ZzeipqNGA63
	 p5Cl/s0ALOSIE/7RcwA9ztXw6aVhmCUXILcLxuWp/XDVgaDDvudkv32SbyF4aHvVq
	 QZj69brLy5vdrLH8mA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1xGvgg1Vhl-0057lM; Sun, 04
 Oct 2026 16:01:43 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/5] ARM: dts: imx6ull-tarragon-common: Fix several issues
Date: Sun,  4 Oct 2026 16:01:18 +0200
Message-ID: <20261004140123.46461-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:edb8Nfij/1RMYgkiegD+OQ//Ekr+LFU2KJ3fdMRtZqp14QtVZ59
 VYWLuC5VdCoUjU/rp8U8W9pDEhY7zwzzywtglDe2GR43xwen6UnM68gF8LaTzz9oc5CPowE
 qem3yY8udZ+u+GGIIwdy5BsVaTggiDh3xJNOIu5vdi6ZstXZRAc9mKewgVCN2Orad1XCqte
 WsMFgLDhiFX8y9MgkaEhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aEL25ehmwkc=;bqgoA7EgJKJ3zOUr4QP51iJIIun
 teW7oBB8IvpHnygdMqjs70qANAUcYAveSrtEfCw0YYYOMCjXayWINgX0zlqWPfJKcF/Sk5lHE
 lxvONrgwYj8rWfvXbkLNQeeH6u/l+Qu6rZs2txd1j48k3W1fnb73WNmwrq+PkEl+TYhDv8M10
 4lamGnbaV88/wHYEaXU/aqOKUjA7jyd2h8eeiwj9diNwn8iChj2BfGEiwgvadnwL/Mbhsk0NM
 g2LUpaKbvURS3Gtc3xFbFW8kR1PeApmdWZ9ojNL8sp1HvmFeBiu/PSfQyW/Fj8Vb5PZkHPJUX
 19JEMb4lE39+7PGG/Rmff06b1m5Cd4lctBO1dqxDni4Sl9OrbctLf9/NkZtn/IAnxqSSCasiV
 aMX7HSuVF13wK1ytYieCNM37qXTRuIbs/OxRVHmbdpSo9LReoSCqZfZ1iEBjZe1mkvAVtbtcC
 /KS9OcPaMvEkgEG26gy8QOdFQ3zAnvapnIDDA5b160h4s0hHU/4puzAKnD+ny4zT0IFRqrPph
 JScE/ceWRWZ1XEaSOvhhfMrBaNEAiyUT4dhz/o3p/ZgKPRQMKP1lJymZkZ0LunAgy2HNxwPgI
 cCNhZuyO/0RMjrmmaVwfnIs8aN5pGjXzCYPJszwkwCUeNkaNm9JD38Uq1ZAOjMfUljBnT7sjq
 MdaTxazz9JuB4o++XyJpzztfVMBrEDIQAdKwsl1ZITiTcR8dlUM15Q4FKQY+pqJ6nTbgEKKdY
 +zye2YupsG/9qdkTs+J3nkU4L05mvK5FEoWp5FG3wjoVy/b4YxpHbMir0/4EzQDLpWS/yTt/2
 uaBsClrJeA5V+TubSypFZ35IE+YHAZuq4jkMQv0QF2i0oFfp38kELmEoVkQgCsCPrYpODmyS7
 Z4/abH6yfxuArUjfI2Qd9OV7Mv4eYFYz5CxzrSSvlLizsMZ/b7GqyGvoYapBL4lCpj6KbNSZF
 +iToghgaXsmuZvzXs8o4U7K8lYqKeJ5BnfQjCFxGhuhnVg1016y4qBWMsFxZeo5OEf+hZc7mK
 q0wb+83Mg8DeWxEJTPu+XURyAJShwgfGMjJg+vhySjo5ZS0DhSofWkrVH61o572KlCCKRXVXl
 7YeZTQKENqq0RbCYQA1SfQBNUk4OsngUhYx2wmxqISSgVsjwu90gb0meb8GI8SbPS7pcun01H
 c7qMx54F+vsfnUUw2OQc/vlQ3FcxK02D/CzdDp3mrY1x/tG+1+jTvbVXprlkosMhmLSZsr/bV
 zFbPmGJt9sG6s/WXjk0LLkP+VXuXQT2dZm7BF7QilVD+f3OkaZ21ZLNgRfrCkuTnRl6KzMaLm
 v3Vz/tnA7PYy+btZKIDrEW50yjZXoBhS6dTNmLLQwaLrL/pzn1qxRUVYNvnticNhaBWsM/vMI
 kgCnm4mZijlEB+kyWZcBN8mi+raWKOEe1IwHddchxoJlupxmCYfsjYRYO2cW20wsQn9//RTdO
 lZcKd6Xld39BIaQ46YOxMeDQZh+EAqZG2mWsufM5uYYFpN+MpB48i/Qn2yMGSvqkXzmZl6RVR
 XHljO8bDWUy1+Al3CjLz7IYtwAOifzk++K9iglflGO8pTNt8zEy9JWSQ+cHXBaBai5jVJ7Di2
 Q6nUIs9pXfg3dEg3X8jYroIw1dsxf1WUygArhBUKpo9t0FJWV/58oySUmDm96BKPPdIYpgSz0
 enNueFM/Ai2aD6Fas/1p8uUkkCLoZ+sYx4zWd56N3vdwRbzlu95kcm4ilxO8n8+vFvF8ukvkx
 OZqJOnetxpXwQDJ7yCEqB4W3e2rVwtISpVUmSIubtvIi0wTz1BtyI7jB3egPbZKCyJ11DhHkv
 qIuL0nw5rGkJ+ivCCHfiLqcdRZhB8YWymCf/gBdVJXBe8bfW9SGQ7gCZv24XpqQTPWOO2/ru4
 kGuiR8FIRgk7UIygzNvGzzFTymsBmr/QeS6cILDlVw39HYUIhHlp2FsglegD3tZQnx96qFxl0
 9TNAQjFAuVFQ33QlIyDiCkB+Rfugo8Iy8xxxz0FPvMsCfoTw0gHDUFH4lMS68C7PTz5Y9MUZC
 tDZ7MFsX3cnPOILTpzuHen103rItZJE6Pnm4056NDCIPzfN07MWdGDQA/lIHOLoh5Mf+DBBVn
 sr3MZaSMZQVpQFlFw3DgHmrLchXeqcEUbM/keERbyDoBx64Q3s6IC+ik1azl/882ul4PV0dJO
 oFSbHjPl17lUqtfCkT9EFr40pgmRq2GLipQlrrfUOgr0XlLqbIysvgeV2tu4OADgg4EOJNnIy
 jOnRvU9OZck2iHegiQ9DTYyS/AUOlJXwE6/bYo8JfJbFkpgS0PjtdUP1J8JV8bzVBcGsAYx0j
 xf5ZC8qsul5ll6MM5FbLAX9X+8/DxQ8uFnGTnmwxaneZpAz7DoOplfFP4Gpu79BxcsrElgyw2
 KSScCARsMq7PDrh5S3RPFKK1IC0gIZ1TbBvo4HejCWD9cVCKdwyYikV1129SS0HL0S4t0z/EK
 083nSfP/MeOQNoqR0jRyzw83131BN/X1K9Tn9EK21oxvgROw0TJissTJdcFZ1AiCZFuifYWZd
 BlrsUMdgq29cqkFTWZ+phgaLi0VewWyoUSBhLqBSPmJSySZR0AjQsC5zkz49ACVEv3kKmrWZO
 0uF7qsBHEjZU0bI81DV6FGHE6V7C01zwUuKSj0WTe1yhhZpbqgpAIYcAmP5zKjqgWw3lvmpNR
 1Qx6PSz2speg3lGcMTa1yl0fqus0nMpSWdc5Loa6OGbEr4hx4whRaf0zvesPR07UK1IAsk3TZ
 XplmAO+0uKwXv1tD8OwP+moBn+f/8dDLmZ5i5DCllw3SVXUr1Ili8/AnYO9wqRjNTK6ILTTU6
 KCLooWRQivsEUyONUQ8TALb9p7nqxkdNG0s+PJ6MYrxRONG44oIIqaORvZWwPQptjBsOaj8dq
 xWgp9m7VyTwLuhn2fdmi7mry9uFcGHqf0c+Ix5xW+lfHa9/+OlbJdrqC59e2STC/rvOH8cCb3
 xJsVp5Av6BOCQMpr27omifkNXrupUybqBa9OZg6/WYGoU+heYR0fLEx8Yj3rpxU5FcD+Temsc
 EH0HCHDuBI2gSIrw9cWjJmw0ElzFGhOq6+LKLYG1XMEqtKytPDLtUqcjzpuGr+ZLhocY2M+Uv
 a/zp8cykYU8bcmc5H7WG9nekBqbiSBDMtjQcbxfO3Lp2g79OhQZGEuFlJIdjgBYzp0Axrb63h
 c1p+AmEoGPlFAs+foNOESGR6rLuZAqSjRVVNNzEg5AquMWzABMwKAuGzOSRdwq6MqkZ+QVtwL
 xLKiBDPLqIzNIYdximtHoRl0oG/qvAKq8qaLrsvGWCRxxtLqC/nvwy5hp8+j6D5R/lE2O9psM
 v3wBm1TNy/9EIwJrh5XMBGIv/sXsFe4pnuMtB5kUqLd/VRUCbHoLVm17ko9YFkvNHI5yQGU8w
 qlaCInY6vXryjFDo7SGozDibgG3ooQHRG2lTV/eCybwgSxIeLRasvRRHspeMmKqjwSasGkBsE
 d8HTYVuBzEEtsEqXW1FvKc9Ij2YtUgkd0DPNmaaeH8ZZAvWg4wYTyv6O4AdMCzHaIZti8WIzG
 xDBLdITuHvrWXKH4R4wxondG0YsDimDm4x1pbqAvnLhgOGiiS7gmsfI/CBWxaWR4l3RpR3aZP
 WW7PBZjMn17EGtDfUlrtYXm/vbiaY0DzPtRg+i707aamA9PpFNG/dRSHSmliZJCHWWY3P3xN7
 lABOn7EoC9e8TjCakdNlyg2c5cjn+p58ehs2b+iThsTSkFQ8gSDdrKWGmTNWLCgE0IBMzBGPf
 tusgh0fOkG5NWuYV1Xbid3zlhz0pSINRxRhPndDyo2kVYIIjZeXhaR9Vfgx6c6jdF1hOqlYZc
 YKg1IOweePa/5T//z0T1jqVZRwCKs4+tNiqDk2wptHCeWD4DSA51awfBe2oPjYae3r+HaCvCA
 GhYJXCL/k0GiQGUq5CnUDsasmmDLQIGtVfeE7SVSzuC0Fqo1eQIo6Rlz6W4hEL27M7LJnDsK2
 mPRi9jhy9yZ6x4CX+K3KOyf52Odbjf/kRx1I/e70gF3O9R2IY55SGQo0M+FY1bEOkgZTKjxZB
 11mE3lbnb15/ohCfOzEvA2SDdZmuIDecVK2daK8pCXJhdGb9mjSoDx8KBOec680cCnI1/rmLk
 4PjP5UwchDYKJ+fnixx0E78k3m6ZfMcSRyDqtLCrrAHRXdRmBxHmnWzglY1x9PKrmGr2gMbwQ
 TYwaHTJQmRjlfWjH4Y92LNrY/Pp3/mwugKjyzrwwuY8CTmui4PV/nPBzvstkkjbmH6PRSFA5O
 oQV5rPRManNXaRfuOQGkrXiCMu9q6gD0Xt5TYEBkBNNqeshVtvAVj7T8ea2iEYsFp4YTZzXaS
 kV+VynWkjjpfwDvLmo8mkqbYrw1OFPRV4MBXQIkv91woY12WZcp/iSeJa8JwSpbLNFlX2ObPN
 ipBEglywm3Kz8OGDLJi1hCUefbL9gDDFqlw6p06vLPXkVkcOEIr0WpP8ovftyHDvSk8zF1c6c
 MZTAyRodq9J7yYNQCNniS3Iln8G7pFvY63dJCR2bEf3VoNNqRXVlOFlfd94uOcKrmZYS/GbYr
 gPnWqQVez9Aik4yyL6Q96c7f3/Mzyd5U7nQEnf2uOQsu+55frR+eo5w/lM0IW9mxMKX8a5G/B
 4v4HvXtGQZLG6i8fNBLsNVRxpK/4iKuzP6Q3k7LnstI8RKUuyZ259kembh62TZTucGxnDeVg2
 IWfc+F3MBdsiyKF5anCX2grr4qtA7eUGGBsboIfeuHom4pyHkXYbgAqe39nbZ4RQ5KAxNiRaX
 sNhPemDfLUKWZ/oiK6IL7B8keHpZtkqBJRWkyvyOFbfsollFOe7jmKlnNEGqwAr45qK+OP5BH
 klmGNiZcfxqYMSlLP5pUK3iDmflTqzrAHthBM0K7rNj+XrTb5LfO1xaCf2WaQGB3/ELivWTnE
 TuwNolpThPV6ROE1CNR6YW95eAU8+rslVBNxx1mIl02JdcLUs4QXmWz7GnGqWflnZue6Lk2VD
 qDWkPY0gcjv8GXzVWe2vLz9etMOWyyBB4STPjmEx94WuQTBu2w7pTxQoBUbaj3My1FHPuj+U4
 0mzqUIjY4XQ3SdMrqAsSwsXSeUHz2QXqMnJAY1cnMQuLHGMSKkl0SnH9Uamx9qgtEqECCpjQk
 xbn3g+mHug4znvbVFSpaMPsRB3q2MXaO8Lm2iCoJ8Yg47NfTg52/mL/qOd9Ei7Bm2yC4RaIhi
 /jwrtKbPcWpJOvUbsFjqkkxOodsFM7c+A5Z7uZnpZ8jHsYNH3h4TjbSgK7tndnu/AuOHWgybn
 8OnTZa6bLi8ScwSt8RLW9rzA2oWPHDeX8vC99bDxmHkogCLMwlUxttANmtl2BYcHMxAUO4GWV
 99yRh5aJ0uq7RAEOa5lfG7H/KwI9FJ1fcCS9EsxKxiKYWvsMSREhlbMPEEz2bmHthElMTPx1S
 mAUjMDSYsnArG7wpkcjsRoRxu1CjgMAQ4F36bXiLeYaoVPuYZ3wdiZhiRWLFjbsuJkR7X5NsY
 QE9ZzSO2POOpi+oU87+/2SwUrns7obKjQixqSnfxEZuSvyhtrGafUBBb+Zq/CmfgpyJs/+vIM
 eHMndvx7LFhfaoR9uK6uuL0D7u2Oy9wLq5FWU+JuqzPDsTBiqCIuzyHr0N7Y5ReIeoXPaJvzU
 GnStDtjMbqHcu7lB7w9ReJOaYA+kvNldTLLHqWS7Bm/+O8Lckxnc2lpzOCBaF8CuVHNnF3yqn
 KHTxFaVnPT9a3RcXZsnyQXy7PMh/K4OnaxV2SHkm4p7T8Tl0gi5qGkWiRfYbI4fgCvetjmTFQ
 dp28jtVelAeORrcz9zxMgaqsH2qMO0jdSPKJbGuR//cHxsNULZLzCHr3eG/N0p6DWAXPpRe11
 WnR8qN3l9wOkMgF1zURbkSErMo49wVbpKYqIQUoTzMWtrF7K75MQ5BsX6mFmtWo0cesgtUuWf
 g86YU5rPy2xo+3/dQCD9pSEuQPmW59+wOC7aCbWvIMufmlk8UcwjBYht/ohTnLS3kopCP2oJO
 YJhXtEQVa0xbwpsVbzerRg8nkCN3NuDvcuJp0sLxT+Q4Fb1b0s6/IYolzsLxnpX1wkP6AMSsF
 xzWso+iPNZW+1P8vW8SDAqwn/jieRoy/l+Evy7uLFwP+mMKNAy3mTsPGSGya657o2rNaDi0C8
 JAtRNvcNjxacWI+A2zMv/1v5dmWjMbLl1IXURhIh2x5Z0v6EPHrri2CKx60zXJrtn3NaOnCZO
 hCZt3Tkp/aQd3+zsEu8430GHZL6YPwJgiriXrZ9tzZTOCMGQrwjfT6rV8oAWWxtFbpSE1dv5e
 2i53fS/RGyNLdzrfPizhhNODQd/fUcQ1igI1Fi0OPgqlWra9EERtArKvOFWtJt8LyDcHSA+3T
 1vHfrcJ4GM9DpdmxaXVlC5S7zU88Fjb1E1A==

This series addresses Ethernet and PMIC related issues on the Tarragon
platform.

Stefan Wahren (5):
  ARM: dts: imx6ull-tarragon-common: Fix Ethernet regression
  ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues
  ARM: dts: imx6ull-tarragon-common: Disable unused LDOs
  ARM: dts: imx6ull-tarragon-common: Fix i.MX6ULL DVFS
  ARM: dts: imx6ull-tarragon-common: Fix vmmc supply

 .../dts/nxp/imx/imx6ull-tarragon-common.dtsi  | 44 +++++++++++--------
 1 file changed, 25 insertions(+), 19 deletions(-)

=2D-=20
2.43.0

