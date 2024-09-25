Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688DF14F9FD
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306458; cv=none; b=qhqxdjXIK7TKtZaDSCSKkmI1fGDvzOpqZ9AOgXYADy/EH0lPXVG22mamrbORxxexZlT0xD1TFzHSA27jSt689gEL8/T6pxCUT6EYxMxSzWzMQOO/cv4LWr35hblJLWPScE6Aq5r0Bt2EnDiaEf61EL54NKYmn8aMamEwqWszWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306458; c=relaxed/simple;
	bh=Dt3mws66hpidkeU8bZmwgKFd/DilihuEBnlmhuq74v0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ljy8HQLN/trnCoDpiIEzZ95425VU7qSMB0lLxdMiUZFKigYxkkJW2YdJQ6BFWLyzPNci8qoLOt+GUQOX+/bsau8KFr2VZltXKvfB1ZVZ2Pp5ZG/QZC/wVUnphSE4DrhbouHZ/gdFuVTkYv3ANGfWgygQkUJGClPLLZiulXu7fUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kexM6z0Y; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kexM6z0Y"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so723996a12.0
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306455; x=1727911255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzQJ809oKF/8Xbcsp5/HlODndiAMn4sR7T/Hw/y3LL4=;
        b=kexM6z0Yd5WAYqRn5ruquQqKHW3CtQmYlYDEL3iLHzWWJTiS0XMbsc8+vluisbjZxb
         AXshW8puOclA7dUllIDfmxwX+mi/3+xKgvehbJjeLHMxkaX8fAD/eptzFEiuNxBOJCFF
         vEltBMfiXKXXCkTg4axEE7XVp/rT2oLJDP7CMpzBDZos6A1i2T0kwQvsV+y6RXHm6p31
         29wq3xVXHVzHtA6XMHNIHO9HJs61j7oQG24EF7Po0/TzyEThMwx3BbMWem9EfFtCrvMs
         ugU9jaE7occVgk2hX46CZTdU724BurskY7P9IHH+gSzBAbmqU96z0dtSqIZvzQ80/skD
         3h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306455; x=1727911255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzQJ809oKF/8Xbcsp5/HlODndiAMn4sR7T/Hw/y3LL4=;
        b=Ums6zuXaDMk1j7UGHOlM0YxM+sBCvcwX+zf8ikJMeLhibotPkPxtcVABdTM0Ul8KVx
         64BY/+68J+m9s7QjyzTvqm29brEJmaN84N6u8vSKG6zs9ljAzX7V+/vi334wNzgyXicB
         IcszIPudHU6wTdsvBT48XulmV3ijS4c1tXGqj6919uV8VHaC6+ViERjBxoJh+YiQ7mjv
         l463fsBNnbUL8lc4hI6sDrv2D0f0JVGvwOyXN2qV4bvEG+WjaDvSHkxKY8HbUfuiUkMj
         YC7sxuOAjHFDEq2QuieG9HUPFV3NWO1S6/6DV97p7rbk2nXzQ3BnczaXB0TWFkgQxEf1
         zRnA==
X-Forwarded-Encrypted: i=1; AJvYcCVpyYl0RjbkWYVlK6SOqf/IgtcbNdN6zqQqvwsBUQvy/RwpzKxUr1cVYMJ70FRJx1FLpCY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBHv43QWLDKMdIWlvlVVFH9qjjOsS+vqaD9ZqaeX0MKdo9oA/o
	3weWzBBqZ1eIMcD2+E8fvNUqS4t2f3lMaJboomkM74Y9GkxAqO6X
X-Google-Smtp-Source: AGHT+IETQdtsFkGWoGdY4X7UEHpfnHcKB9JMAlZCzHF/aPebg3M4dDMG8IxcrM6yp357zbxA8T3DDw==
X-Received: by 2002:a05:6402:40d2:b0:5c7:2209:dedb with SMTP id 4fb4d7f45d1cf-5c8777b59c1mr999343a12.8.1727306454482;
        Wed, 25 Sep 2024 16:20:54 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:20:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/6] configure imx8 dsp DT node for rproc usage
Date: Wed, 25 Sep 2024 19:20:02 -0400
Message-Id: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Configure/add imx8 dsp DT node for rproc usage.
Additionally, fix number of power domains from the fsl,dsp.yaml binding.

---
Changes in v2:
- Modify subject of commit changing fsl,dsp.yaml to state that the change
  is for fsl,dsp.yaml

- Fix issue with arm,mhuv2 binding found by Rob's bot caused by the
  changes to fsl,dsp binding

- Improve formatting of commit messages

- Link to v1: https://lore.kernel.org/lkml/20240918182117.86221-1-laurentiumihalcea111@gmail.com
---

Laurentiu Mihalcea (6):
  dt-bindings: dsp: fsl,dsp: fix power domain count
  dt-bindings: arm: arm,mhuv2: remove power domain from example client
    node
  arm64: dts: imx8qxp: configure dsp node for rproc usage
  arm64: dts: imx8qm: drop dsp node from audio_subsys bus
  arm64: dts: imx8qm: add node for VPU dsp
  arm64: dts: imx8qm: enable dsp node for rproc usage

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 62 +++++++++++++++----
 .../bindings/mailbox/arm,mhuv2.yaml           |  2 +-
 .../boot/dts/freescale/imx8-ss-audio.dtsi     | 20 +++---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 27 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     | 29 +++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 15 ++++-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 19 ++++++
 7 files changed, 148 insertions(+), 26 deletions(-)

-- 
2.34.1

