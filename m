Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09C40862D
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098223; cv=none; b=bDT9KBcS6q11Xt6e5UttBxlmYqzLz4rV5gELgMxCB90oU6xOo6/znAFZwkoNz0EMAjpq/eXMeAyhBdGVeb4LcF5RIuFbMI+5OLo7t3Sa/VV5rwDJDH6BVCJMpmLIMDsrS1UhpZqcuJ82M68kvzv5lAeSB6lONNtZhQGyNy50/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098223; c=relaxed/simple;
	bh=S9GrdPlgYoanRULfpFXKDc0GUTXpVI/Sa7l5Ugs4ivI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=oUAey0wyjU02eGXV8NO3Kxh53PMbBnILX4YhfeQeukoKr+WoFlZD64unX9sYJFqtr3RAIC/J0G7jUVx1GK7MxiDaMG+Ni1j/npALyt0Qvsky8nod/4xST/WWKimdYfKGlYNb189UV+HveteCepGCpVlHtylQBXbuv+Avao83MMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RpL3FUhP; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RpL3FUhP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 182BB1A19BF;
	Wed, 10 Jun 2026 13:30:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC5A65FFC9;
	Wed, 10 Jun 2026 13:30:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69C2A106B82D9;
	Wed, 10 Jun 2026 15:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781098218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=shrZ7CpTKyIgEFXVs/ZXsWjGHpF8pSdJAOdanCrWqrg=;
	b=RpL3FUhPUcKqrnMh5NSyakg6RJXeX2sWTGp1hyfNIQYIEfnK6eyJbhv448ghySEjepxq8J
	JYrNz5epUEzxjS2cLc4hdYPhBVjfngOPS0+pFuqKPn0kQejY+G3j5dzI+06FkZaFMddDg7
	lndOEhaZkCidVj9Dip0DQiIlblX5NHGUQTvGTC4f3N0cxvrVCyUJfeYemclTa2hSrGRsUZ
	Gx5yWMSQKwsjfdMBnPh96uo4TCAP7yr2neSIwdBGg9O92IO019jRRQMRBp7Y519+92QaDa
	7n2/BQFsQpUw+yBiuj2mV6XVQUUpCem8KHzXzYL5S3cjz3Fu8O5MkVh3/EscWQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 15:30:10 +0200
Message-Id: <DJ5EMEA1QBQG.VPAA253STNJH@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
 <20260608-garrulous-silver-junglefowl-ea4dbe@houat>
In-Reply-To: <20260608-garrulous-silver-junglefowl-ea4dbe@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 1:49 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:34PM +0200, Luca Ceresoli wrote:
>> Bridge hotplug will make the connector dynamically created and destroyed
>> based on hotplug events.
>>
>> In preparation for that, add a mutex to mutually exclude connector creat=
ion
>> and destruction.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> What is the source of concurrency, and what are you protecting against
> exactly with that lock?

With bridge hotplug, the connector creation and destruction can be
triggered by different code paths, so we need to prevent to:

 * start destroying a connector that has not been created fully yet
 * start creating a connector while the previous one is still
   being destroyed

Both conditions might happen startig with patch 36.

So I guess I'll just squash this patch into patch 36. The commit message
will become quite verbose but it amkes sense to do it all at once.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
