Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD43DA5C1
	for <imx@lists.linux.dev>; Mon, 11 May 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496176; cv=none; b=qkOv/PHGJ7rCEbF7Shiv15meOu1O3tyMNlSCsMeln3H3x8BpPkahPmgYb90mzo+vHa0J+ZQtUYx8K7Ry4F1s0kRl6tRlbR16crcRdWp4LSUfr7wJdMehWgA7rnKKTt6Pntfrm0eguIPV2W2fv070s1GmqjkKh40vF8KX9MzPrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496176; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeIEylks0EoEx+xIuo+ecnwWr0f7/NlZdOPHJCkdWqsf+7UP9bcU8jv4PKCD5lyNHptz2PplhU+RitvtuJCCvyUcAvNRR+SUxcYdfUYRx/ToN3zajM/XRwVYbulumroKE8DRhqbzEMIVmq0QjVD5upwBh15I7vpjiX8rwN+gTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG/sOpz6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG/sOpz6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-365cae89bf5so1739977a91.3
        for <imx@lists.linux.dev>; Mon, 11 May 2026 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496174; x=1779100974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=gG/sOpz6kz7kiqea1I1ZjQrymVUktmvR5mMJpne9R2FEvvGSgtuDaWKH75flOVLvik
         guwPB07ENW93CgF42hRDBpvas/J4ZwzSPneH7P6kOO3TmBl6wzyqeOfQL9bx1qDnE4Ce
         i9Ui1Nku8J9XbAslbdBtGx2e7FeBgeL7omzSnkB6Sj6wd87N056srrTt6zQjB1VZGNcu
         LN+5iq4cLAiZzYYxWcmDkfz5YHXfa6m2RNLvxoy84vOkpYg8s4k6uNYONut7bx197ror
         9Q8VxWcE8RYU1E0fg+Kj2aiupZRO7h0ERHsE1pATxK7HqPIoHYtCDHOZNj+joTYFMVWI
         79EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496174; x=1779100974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=sUJZjP6vxvgP6aLe12jbVohxW+YTNTspwUwsAzFFsL+JPde6VsxiioN+NwLdCcjfmt
         B/2nMtPk06YCKTyTbFprOtZmKIhBF/jxVxFDs145SlBHC7Hp9BfftSRKsP5b1bsOvXOm
         I5DZcQdllfFa3t+3RX/tulx+MFPthVuEbcMoMWJG6Iz6CyIYTtzXdv+D1WkmjPWZBv5v
         4A/Ii+uVvP8suRhVS7AZKfTkCswii9oh4Eg9+qQFqO14ULsuRXmBab00dUqYv71Rr5BM
         Kb61gVikRJQ9yEwxtf+ScJVBkndfJzt5aE0BkPgmJuEthbN0r/WOrUWWuxBIVPFNTVD+
         vxjw==
X-Forwarded-Encrypted: i=1; AFNElJ8JcW4a5WhIzzbYP/5+BOuqVw3kXRIk+/E+XnC7VyAQSEHTQSuvPlIKbIC71KKpbqCTT2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyHP0KWrDxhXpZZNDrm/zTYYkaQ2Y+3xGYkvj2DRX8oH04R5Rb
	AD6LOGcQk2dypG2QGQChFEgktuXpZTGJiKPEoqgVYIXbQO6Ipl7OyAX0
X-Gm-Gg: Acq92OETL9oaNcdF/BjxVI929xvhTQ6ptB/N7Qg2vbV5mY7erfwzBzmmsZcvwLHhatT
	pyc2LovnsophLVsXYyb3niMHLPPT5XzPELsEouEBpL1yTbvORufVnYiGxWwgHk9DwjPbSw9n6Dq
	DxGqOupi+k9az6PmS76/4NlIQVkW1mTUjOZJW64Nd4rnnXySHBHr3A/CzFlVy5tqOtY9AM+K5oy
	o7lEpfwDFDtFhtNFJkyWCFG737KLhEmxuyJlSlmBsNU3zTWbtvXGDmoT5+ChqySJYhv3EpQovEd
	yGOxJ4dJ3i8I/IsXVW4z33EohbyW0qbqFqFWe5rhaUUdboUqaEXh8cUEJGLW9P8ZUJwKEgAtw+k
	qwEsC5sBJygsfrpPNy4/CHY6HZ1Qc5Q67nvRsczpDi3zC8mAC6hrCUUke85FbXtF4lGK8XEA9nQ
	pjYOAMU5pCcnYi3g6g3vdhu2Byq/Hz
X-Received: by 2002:a17:90a:110f:b0:366:1c9e:99b7 with SMTP id 98e67ed59e1d1-3661c9e9b87mr11161538a91.25.1778496174159;
        Mon, 11 May 2026 03:42:54 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:53 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 1/5] media: hi846: fix hi846_write_reg_16 handling
Date: Mon, 11 May 2026 18:39:23 +0800
Message-ID: <20260511103927.279550-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

