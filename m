Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FF14AA4
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g/PqJupx"
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id E1418D830F
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 10:09:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B16DFF811;
	Thu, 30 Nov 2023 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701338991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvljltiRA/0ipo6rsSpOVOq9yCewhyizJDRIN7ESJBs=;
	b=g/PqJupxHoS1SgFzAvk3uFQbyqqgNVDpPtoLQ3pGuKRtRXheUyBKcIyIz5VdfM1hpCqvk2
	jiEd+xFGEwyOHydd6sZ4HZCxcb9uYWmOBaWUOsg19FGhpsXqPNZJ1llSNVJn6mfTb/2OsB
	k+XmKXlD+yBeZBoqYW2AoJEiNnoPAw1siqwsmzt/uudNfzgPZW5mnErETfgRv2zUpqlj48
	Jb+Pt398+IORIyHmR7pR3UueFE/QS9vrfPkvpBjFXgyLGy9VMQ9o+RsiUFDbsTVzctyD/K
	FLzTKbEWUlKSCXnfsTaLZb6iskZEN51WPSIqiByYh49zmH9goiul68e/FsWxcg==
Date: Thu, 30 Nov 2023 11:09:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 5/6] i3c: master: svc return actual transfer data len
Message-ID: <20231130110948.11a1ac71@xps-13>
In-Reply-To: <20231129221225.387952-6-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-6-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Wed, 29 Nov 2023 17:12:24 -0500:

> I3C allow devices early terminate data transfer. So set "actual_len" to
> indicate how much data get by i3c_priv_xfer.

The title prefix should be the same in the two patches addressing the
SVC driver.

With this fixed:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Thanks,
Miqu=C3=A8l
