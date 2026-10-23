Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756376;
	b=3tenrQutKu7bEkDvIZSb/p4Ham53RNfpoG4U+Xe/dJ3jB5hb73r2n2Tomj5GI3tm13Pq
	 B38+DPbkEUx8gKsDB3d61k9ZJWz8l9XEYTnsVWkxmD7csl8NfbZRlzjZfSotQW0yvH+RT
	 dnCt0TnPevfguJaZK8Jr+6YXNTmrSyBHVlZ9lVr4ZnbX4uJqepYc8Dx5202VNyz9bZTqK
	 Jh2jFlYHM8pNCUFbtN4D6NnXNuSND4HGJTrE6rWnwqV4lGZxNUwpHu0RFinSF5PHC2zBO
	 vgKWz9xQRoZPaMMRNsYJAJyFbzt7Sfuqhepr8iI8IZHxmSeNHBeNGl0Sq1oJUAwaVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
	b=SnHxRbyIM3DUB4PbaleMXoJSicThVAUBHUIwGrjpCGiwdweX8tKLZLasYZOGK85L6RiR
	 Fd1zAwg8ayjctVQuo3znodLO7vnREhQFDXhJqnRG98oKywYMkTB+mObjwRxjB45Vj+K3C
	 xDne0MJoi3v5mlhasF4yo9yNca9/qMG7RgkAXg3J9OC+Qq9uUSFCKsj4Lj23u7afW0qw0
	 SrmGrFGxaMdvriUz6PpnC7Z9CTBcL2l6zLKzFoUJqQ+iJQsnAUwQocZdPY/nIpts/gxrt
	 PUOwLi6jbG3jlwV0bWDktiW3vmxChu81Ivt573eDMtQ/X+PiOX6vorVnHec50c5evtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="HZeXJDA/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F4606A31B
	for <imx@lists.linux.dev>; Fri, 23 Oct 2026 11:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C35F4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HZeXJDA/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5529725e9.2
        for <imx@lists.linux.dev>; Fri, 23 Oct 2026 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756374; x=1793361174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
        b=HZeXJDA/9AsX1KnTAG37fgXvovbHAa/Y6UZt3+x5ThNfJ1l50hcYV7HOuyNkYp2xhl
         KQ31SMnY0pgfLv+ObVZ+knPgHZuR6uwll5uT1jaj2Wfv1+FIevL/OLnlOeoUbNB+lgSx
         vI+0GyxJkDXPQOzNC/hQN3aek6ywxYpObUqhRsbXEgX+y3YdrngRnwy2BP9Mgpkj8mJ3
         CXaKhqIzRH61W+MHA93RaY1jPf2F4wNUHyxE/LAcI2e4HHf5RlSRmZD2EqqEcVcN6coN
         abqqmRm4EPNK1td/8rfZOYhCOwPFPfj4VHU0LTK/pqotNUu28twX2/lDYXfcmr+jOVWa
         RyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756374; x=1793361174;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
        b=hMc6jDGbAur1IsJevph9WikNN9mvVwzZZpws5JRJxBSP09qLCMgzJ2NXzmZX0fRmh0
         ojP5kQgGgmtFT8oKM6gqg5D/pD0eYxOZ13g0PnbJ9iq9rtigmBSe66TTu//S0rvM5Cx9
         IDmU01lD1BVsMXUEdGdVq0gUmzh3dI6IiPvs89PRz9813c2u8TQt43uvAwRtb5Hg1p0x
         tMU3O79BnTf88Nt/NLaOMjFty0D35LBjW9WtdM5AfEFbFcuD/khKmdhYTrzC/lIoa13c
         2gpm0BNlJt5NH5c3h/pVAjJJdvN7/KGvPcAeHL1J1DgIuqY+cDvV8XMOKIMw8gFTBo1H
         5AdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDGyrjb+pR6FWbcmvzX7Iz8rfT+9CJpUhhhA25z0RaIjLNZgb88LTVxrXqESxxW4ONYP4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJb9yQD5oR2tLhpZSv1/yFFdctddKL3jddMJYU14YIVQmrhKDTT
	k96mrHja8vZJRage27EHGoRt40d/p1ZyPzMsCktwutco3DZXd3++bg5i
X-Gm-Gg: AYBFou0CB5RC2oArnbzJlkUm1AT5LdMsl3p178iqKjlYsvGRCGVBdWdar6AFDr98xAc
	FRUEP+aWIkE2IoeN0ZdtfWgUPnHq0LGp3gWVH/ootFz0e0Xd/6ntn2Oid1LE25WS7XM8JVH0M/5
	r4eGQ42GrDzw/Qj7Efaxffav+YFWdUIX9hZChumJLngvyVMyk+e+gvaFBXjpG8DMJAA333uYu01
	VjTYrXHwbtjHI8aEkzoerjAvRkEgoModPa3YXWKMJYiT/iE0A9giljiuOKUBfosthu+ODrv3y64
	bIgnoqe09rjNND2AzTu+iyN3SlAWt8hZ/b0PWcLOOcG7UHpKrG2zoqm0xfuFc3RJpEIK9fHcjCl
	zYnhgdAczTCeYj4Urv6PhUH2ym3TIypPIj/TdrBo4HEE9c2bn95dliMnDf5+rXAOTcEVilKnI0y
	26IExeTjXnMyryWZsc+eKBG4nfEitkrKo2t3in7JXQWNIC4OpLiNPsRA3xoVbYIrIZv42zI1zZk
	79PeX/t79CheyMY8yC1aZPXOH089SMh4KFnUTsDx1IZH1SHBZUQQfum1gXOjntsaUVtIjWLxPmN
	gDVYDKcBeNmvUkMzZGk1FxlpDg1CbUDC/llrLWgQib1NcIrTuZvLwRxz36iYH6F1wa4tgeWL5V4
	=
X-Received: by 2002:a05:600c:c116:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a211dd9423mr26760585e9.32.1792756373823;
        Fri, 23 Oct 2026 04:52:53 -0700 (PDT)
Received: from GLaDOS.station ([187.13.215.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm83319775e9.8.2026.10.23.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:52:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [RFC] arm64: dts: freescale: Supporting Variscite SoM and carrier revisions
Date: Fri, 23 Oct 2026 13:52:41 +0200
Message-ID: <20261023115242.11197-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,=0D
=0D
At Variscite, we are starting to look at how best to maintain upstream=0D
Linux support for multiple hardware revisions of our SoMs and carrier=0D
boards. We would appreciate guidance before settling on an approach.=0D
Our goal is to support new revisions while allowing customers to keep=0D
using current kernels on older hardware.=0D
=0D
Our platforms are typically described by a SoM .dtsi and a carrier-board=0D
.dts, for example imx8mm-var-som.dtsi and imx8mm-var-som-symphony.dts.=0D
Both the SoM and the carrier can evolve independently. Some revisions=0D
require changes to the hardware description, while others may work with=0D
the same DT. Over time, this leaves us with several combinations to=0D
support, without wanting to duplicate complete device trees for each one.=0D
=0D
What would be the recommended upstream approach to organizing and=0D
maintaining these revisions and their supported combinations?=0D
=0D
One possibility we have considered is keeping the common SoM and carrier=0D
descriptions in .dtsi files, with revision-specific .dtsi files extending=0D
or overriding them, and small top-level .dts files selecting the required=0D
combination. Would this be a suitable structure? Are there established=0D
patterns or existing platforms we should follow, particularly to keep=0D
changes for newer revisions from affecting older ones?=0D
=0D
We are also wondering how to handle revisions that can share the same=0D
description. As a concrete example, we have discussed the following=0D
possible grouping for DART-MX8M Mini and Sonata:=0D
=0D
  imx8mm-var-dart-2.0-sonata-1.0.dtb=0D
    DART-MX8M Mini v2.0-v2.1 on Sonata v1.0-v1.3=0D
=0D
  imx8mm-var-dart-2.2-sonata-1.4.dtb=0D
    DART-MX8M Mini v2.2 on Sonata v1.4=0D
=0D
These are proposed names, assuming that the same DT correctly describes=0D
all the hardware combinations covered by each entry.=0D
=0D
Would it be acceptable to keep updating the first DTS to support a=0D
compatible revision such as v2.1, retaining the v2.0 filename, as long as=0D
it remains correct for all previously supported hardware? In this scheme,=0D
we would add a separate DTS/DTB for v2.2 only if a different description=0D
were needed.=0D
=0D
This is an initial idea rather than a settled design, so suggestions for=0D
a different approach would be very welcome.=0D
=0D
Thanks,=0D
Best Regards,=0D
Stefano=0D
