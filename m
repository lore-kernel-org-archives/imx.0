Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913FF2010FD
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427895; cv=none; b=B+6KU45ao1OyiPl2ge0AlSrDaK7zGbee5TKgO4WXIsHuHObC+B3gNdWyHwseFIlNcbbiGUW5xQyO8+hQ2OvBfLiqk/+OVbCSjsWsCLBp4bJ6QubA5d706tdvOxaCNsx4wyc5JbhRiCVTg42m6YVJsUwOlIWxBb2jAej57h0Hpic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427895; c=relaxed/simple;
	bh=qAWTot885s+HJHOrMvpF9YdGKqoyNJBWi6FZYkvQ1ks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xcj8jhnm48mAKt5c5Ez4YHy/GboLzZm88q8bu4R3ZAZ0oXOt8kzTypSdecfZVW5RsNUQSm2gLSnufeP8a3FhdvEtMiBF5kWrTSPbDNG4F1bA73HJHhzI4Gi2aj0sY+FoMfKlZj++mYtzz23rbPNC3V30qVij56m5gzoFWmw9yr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hRKzjB0S; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hRKzjB0S"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C030F4000B;
	Thu,  9 Jan 2025 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736427885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qAWTot885s+HJHOrMvpF9YdGKqoyNJBWi6FZYkvQ1ks=;
	b=hRKzjB0SQeG+aaDAr2xjePmzdCJraat9EKEwn3jmyKlQCyDlay3fQ8uNenn2G1JIaeUp/I
	aze8iYQFOTJI2Ty4Hnbpk7jAkH2T6b9NXec10sEUlsJ+e9zc9PvlqTtrfFVtEGelyCx4XE
	uQpW4m4B6u02/6yraH8No1uQZ6Nml//2dvf5pXKr40znYi/HaxFlLZhk9pid32EYqaQO7M
	63sL7TLeuKynSccsZap3af3iIBiRa3DMVaHwU79VM7BdmDk5451IQxEaRbrNwIWzHgDU55
	LU7WCosM9jOF2jfCFmg8Fa5IJlZD+/NrrB/YtNYTATQD47aV8f35W7Xnmdp6RQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,  Carlos Song
 <carlos.song@nxp.com>,  linux-i3c@lists.infradead.org (moderated list:I3C
 SUBSYSTEM),  linux-kernel@vger.kernel.org (open list),
  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com> (Frank Li's message of
	"Wed, 8 Jan 2025 17:55:33 -0500")
References: <20250108225533.915334-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 14:04:44 +0100
Message-ID: <87plkwcf4j.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

On 08/01/2025 at 17:55:33 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
>
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
