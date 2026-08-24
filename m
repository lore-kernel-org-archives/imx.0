Received: from sg-2-1.ptr.blmpb.com (sg-2-1.ptr.blmpb.com [71.18.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BA8381EB2
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787600089; cv=none; b=dM0gjjByY0p3hQKljkIlMsGWnGY6spwpYTflc1QmKd35NiN99lIv6LTiF72nw3B/aHBve79yCD0/KxgU23KRvXPad/5crEsJQ6lANbGIH1G9qQpyMytjBakynSe66Z7KuyjFNgc0vSc0uZEIo1Ouw4sH8++/dnX2gtc2WURTaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787600089; c=relaxed/simple;
	bh=tvQlMxKkIH2oKDKKXuEgwZJQrTUwhysAsMXrTyfViHk=;
	h=To:Cc:From:Date:Message-Id:Subject:Mime-Version:Content-Type; b=DUE4UuhTFQfRfofrLzWx215bOdLDETaWi0a8Xx8D/hHrXWSoDP21eNOhXKa43hd8asBbT0ksfsTWSygJqR1Qp1TQML5ZaocwhPFcmv7aMaXc0p2wg2hLsyKy8dyUW1pC1vQ4h5+AthyTT2zV0ksIt7Ze4bnNbmEsL/hRiBP1duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=o0n4cOye; arc=none smtp.client-ip=71.18.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="o0n4cOye"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600078; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=boEOCVgjrCz8ZJeuLRkxsMFBbR7lnEtVxuA2ok9SNbw=;
 b=o0n4cOye+b/CbYeR8tac8W+3qdhLksSldwTQN9ILNc6QJqk/3oRwKEsZdtLXC643E43ELZ
 oY05E95LaLF69w9TRcY1nnIdZkokrZpkszeFRn/P6IWfrNkXxyWGldrisBGU+x1bjEZccN
 CTS6GyV9c0hi4jXCGfm3/tBxP2krYHMtbNrQjg3JSszOYwziAkeug/drUuNlQ/AhG5sRFL
 MdO1+AIsUf0/JuSMTVAwouWoTB31/RFCl0RZ98WXwkg5CZuX5V9cmEFjYOsTI6z63nClKB
 Zye3D2SNTLt1+Ppeoajbioa6ipXb02ef8GdC+5BEa+992nJVWUG8EsBw38Biaw==
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Date: Tue, 25 Aug 2026 03:34:29 +0800
X-Lms-Return-Path: <lba+26a8c9ccc+fdca07+lists.linux.dev+me@cherr.cc>
X-Mailer: b4 0.14.2
X-B4-Tracking: v=1; b=H4sIAMWcjGoC/x3MTQqAIBBA4avErBswo4yuEi3KphpCDe0PwrsnL b/Fey8E8kwB2uwFTxcHdjahyDPQ62AXQp6SQQpZi0ZWaGjiAQ825M4Db+c3LDTNSkmh63KEFO6 eZn7+adfH+AFuVrQFZAAAAA==
Message-Id: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
X-Change-Id: 20260825-media-timeout-work-1cef7720c63b
Content-Transfer-Encoding: 7bit
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:36 +0800
Subject: [PATCH 0/3] media: cancel timeout delayed work before freeing its owner
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Three m2m codec drivers arm a per-job timeout delayed work on the
system workqueue and only cancel it on the job-completion path. If the
hardware never completes the job, the release/remove path frees the
object the timeout callback dereferences (via container_of or through
the m2m device) with the work still pending -- a use-after-free when
the timer expires.

All three are the same missed-twins class as the recent mtk-jpeg
jpeg_work release fix and the host1x timeout-worker fix. In each case
the fix is a single cancel_delayed_work_sync() placed before the object
is freed:

  - mxc-jpeg: cancel ctx->task_timer in mxc_jpeg_release() before
    kfree(ctx); the timer is otherwise only cancelled in the job IRQ.
  - hantro: cancel vpu->watchdog_work in hantro_remove() before
    v4l2_m2m_put() frees the m2m device the watchdog dereferences.
  - mtk-jpeg: cancel jpeg->job_timeout_work in mtk_jpeg_remove()
    before v4l2_m2m_release(); ctx->jpeg_work in the same driver got
    the equivalent fix earlier, the device-level work was missed.

Patches are independent of each other.

---
Shengzhuo Wei (3):
      media: nxp: imx-jpeg: cancel task_timer before freeing ctx
      media: verisilicon: hantro: cancel watchdog work before m2m release
      media: mediatek: jpeg: cancel job timeout work before m2m release

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c       | 2 ++
 drivers/media/platform/verisilicon/hantro_drv.c      | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260825-media-timeout-work-1cef7720c63b

Best regards,
-- 
Shengzhuo Wei <me@cherr.cc>
