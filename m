Received: from sg-2-1.ptr.blmpb.com (sg-2-1.ptr.blmpb.com [71.18.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076473C3F44
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 19:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983311; cv=none; b=K08yG2xF1leQnyh9bzJkF+9aPY1GSdSjb02nJD29uKXlNW5jwqU1jh6G6vXPyJcTOQcyyFeRyrskXog4PsP8QEK0I2Y5xiP20Y9v1Tm/1hEfCNoiensoS0khPoIhTvitmUmeVmknjmFpPpraUx5d/yf7FwlnE2Oi+8HvhMZaa4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983311; c=relaxed/simple;
	bh=bIHnFJeIR8NCizBam5bSpQWNUrltT1kv2ZZq+/mblJQ=;
	h=Date:In-Reply-To:Cc:From:Subject:To:Mime-Version:Content-Type:
	 References:Message-Id:Content-Disposition; b=POryaoJNyaTYcgtccXERtqGN/WuPWJ5azIx42W6I98pX7i6dvJYwADCwNQDKSeMR0kgIRcvcPceCxpSl/Ucl2cQT09WppAXwXLQydTNj+ET46OEbOCj9oh4KDFzjE7lDIHAxmOdSc9jH/d+vYY/PYOUph8XDpjJW+bxzh6ctv3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=IHW3e2mQ; arc=none smtp.client-ip=71.18.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="IHW3e2mQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1788983296; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=VWXdC+EiFgKXDk4rNFutmJw52+1YadomDGamPq9rKuI=;
 b=IHW3e2mQi6/o4orGzclZk1XIgRsFPdaWkn5bD5vJvp9vNlWhYsuJegb9BlmzDA2ZYMAGfC
 HfqumZKKN90TLdO642EJJy1s/01ti7hz/QZhwPjEzvNEst3IbKYjpNR1C8kyd4lEs7cPKz
 jZET06kpwF3br5pxxYFHHIjsQGrR2GCzruD1yzc5L4VdXirNs8pVx7IH3iN3Y5flydGusi
 jkp5BvUMHxDT/2x0fKxx3ZSbFBPDp2TyCKpnNgbZypIO0LtvqqK7xrVo6WqzM22CeEyU82
 NZoU4AMJpJ0pyiWpugMXumuYmO8q6Lc1QHMPPDbsj6TcmSYX6rJbsUckjSMGCw==
Date: Thu, 10 Sep 2026 03:48:11 +0800
Received: from nobug ([111.42.148.144]) by smtp.feishu.cn with ESMTPS; Thu, 10 Sep 2026 03:48:13 +0800
In-Reply-To: <CAABR9nGshJE96aCZVriQeMd+7Zjua5n+EKpUTN=953sowUL0Tg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Cc: "Shengzhuo Wei" <me@cherr.cc>, "Frank Li" <frank.li@nxp.com>, 
	"Shenwei Wang" <shenwei.wang@nxp.com>, 
	"Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, 
	"Richard Cochran" <richardcochran@gmail.com>, 
	"Troy Kisky" <troy.kisky@boundarydevices.com>, 
	"Fugang Duan" <fugang.duan@nxp.com>, 
	"Lucas Stach" <l.stach@pengutronix.de>, 
	"Simon Horman" <horms@kernel.org>, <imx@lists.linux.dev>, 
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: Re: [PATCH net v3 2/2] net: fec: free the PPS interrupt before tearing down the PHC and netdev
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>, "Wei Fang" <wei.fang@nxp.com>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc> <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc> <CAABR9nGshJE96aCZVriQeMd+7Zjua5n+EKpUTN=953sowUL0Tg@mail.gmail.com>
Message-Id: <aqG3-ySw1AecQVkD@nobug>
Content-Disposition: inline
X-Lms-Return-Path: <lba+26aa1b7fe+bdac6a+lists.linux.dev+me@cherr.cc>

> > +
> > +       if (fep->pps_irq >= 0) {
> > +               free_irq(fep->pps_irq, ndev);
> > +               fep->pps_irq = -1;
> > +       }
> > +
> 
> I think fep->pps_irq > 0 would be more appropriate here,
> since the IRQ returned by platform_get_irq_byname_optional() or
> platform_get_irq_optional() cannot be 0.

Hi Phuc,

You're right. I hadn't checked whether these helpers could return
IRQ 0.

I saw the existing irq >= 0 check in the request path and wanted
the release path to match it. I used -1 to distinguish "no IRQ
requested" from a possible IRQ 0, recording the IRQ only after
request_irq() succeeded.

Since both helpers reject IRQ 0, that extra handling is unnecessary.
Keeping pps_irq at its initial value of 0 and checking > 0 before
free_irq() is sufficient.

Wei, I plan to drop the -1 initialization, use > 0 for the release
check, and reset pps_irq to 0 after freeing it. Do you have any
concerns with that change?

Thanks for pointing this out.

Best regards,
Shengzhuo
