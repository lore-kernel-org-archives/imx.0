Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F12178384
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 13:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617441; cv=none; b=dU0pTfxK1xa17BEnfWqxKh0oanMNy6qBtFwKPOo1N8z6rKo5351b2ER4eNz280YCwqXhkjcGenYIgHSMsmvh7Y/4uxJ7zomQi2GjbPCGe2rFrCtbdxElRGOR4IX/EJgwHWZmBi2TZhLDZjQAw88sEIrPmuojaO5Y+dBp0FvF3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617441; c=relaxed/simple;
	bh=inAw3f7g7F3IY2IUkhvyADvA2yVM55yNgSiBz0oXYM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cb62CmpqEEe4YpWKVJ5lai3KzQU7wDMJUdAoUBFC3YEYr5toaizar2rsk/xfd0nAfEllbmq/0LObzrLjgkapjxDxx7LIYYANc1G3KuvzIRBa4jjLH4tpJRstl5nQvIH+RYqtQjx6fUhKD8FZiNC2/Mw5oiY0vNQ614zoxCPcZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X92iHOh4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X92iHOh4"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA820B3;
	Sun, 29 Sep 2024 15:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727617346;
	bh=inAw3f7g7F3IY2IUkhvyADvA2yVM55yNgSiBz0oXYM4=;
	h=From:To:Cc:Subject:Date:From;
	b=X92iHOh48Tso/ejvdM04wgkdGsyPTGos0/OhqFcjyuZEGkvpzSAvqZqutSuEnTt1x
	 LW0AxFrYAJFqy+Eg8A66Gt65AxVsPfj2+UQko7+at+kqbofvH/SLf9AuuY6GtIrLLJ
	 pXXCji005Ndm3hw9bP3Foz/8Wit0EKQL+soiaCrk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management handling
Date: Sun, 29 Sep 2024 16:43:51 +0300
Message-ID: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series is a reaction to "[PATCH] media: nxp:
imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]). Instead of
making the PM handling more complex, I think it can be greatly
simplified.

I have only compile-tested the patches. Guoniu, could you give this a
try ?

[1] https://lore.kernel.org/r/20240929101635.1648234-1-guoniu.zhou@oss.nxp.com

Laurent Pinchart (3):
  media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume
    time
  media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
  media: imx8mq-mipi-csi2: Drop system suspend/resume handlers

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 113 ++----------------
 1 file changed, 10 insertions(+), 103 deletions(-)


base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
-- 
Regards,

Laurent Pinchart

