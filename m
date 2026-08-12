Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C3416842
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528481; cv=none; b=mU2J/kI5xMTUnpRAlUPVLO+NYGVKXIWYIw4/8sHjEFqa1PQaJJtmGCvJV43vCrVWvPaxFvr6bxuv3rjoLkENdfcnFr6FX27znKfU12T+gp0EyEypXOcqbctaxYzGbbn4lfMsekAYuN0L2F4NDAJMt/+8aoZHx8XBLW5voIU9Jv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528481; c=relaxed/simple;
	bh=Vd2aaOv6oGFpPp+DD+qyW0/U3Nl95FJOumcz4tnIosQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=B6QdFvaZNE2q7/DyVU2A3xr0swRpsaCK2KZSWbCUYT3HUHpMsBZqQk70+j0n9KTj0avsVQNFgMBOo6phVl+2ySQklCthI5VZcYRA97a95udHNVwyb7ACaMdMelbztA7uspsTqQ3OIl+nmjb8O9Kd3HxNhV+BAJ+1LqAwBiQ5hss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wu5fJ-0002sx-7q; Wed, 12 Aug 2026 11:54:29 +0200
Message-ID: <cf29d49d-cdab-4bd9-857c-495076333e77@pengutronix.de>
Date: Wed, 12 Aug 2026 11:54:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: pmdomain: imx8m[p]-blk-ctrl: resume hangs when waking from
 suspended state
To: Advait Dhamorikar <advaitd@mechasystems.com>, linux-pm@vger.kernel.org,
 imx@lists.linux.dev
Cc: s.hauer@pengutronix.de, Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 ulfh@kernel.org, kernel@pengutronix.de, bhushan.shah@machinesoul.in,
 festevam@gmail.com, xu.yang_2@nxp.com
References: <CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com>
 <CAAPs2HQcHpDGqhiBXSLOKmXWGevmWbGO3UtfV1pmoiF+wC6aLg@mail.gmail.com>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <CAAPs2HQcHpDGqhiBXSLOKmXWGevmWbGO3UtfV1pmoiF+wC6aLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

On 7/22/26 8:10 AM, Advait Dhamorikar wrote:
> Another observation I have is that if I disable the MIPI-CSI related
> nodes(MIPI-CSI, ISP, ISI), HDMI and VPU nodes from the DTS, or else
> unbind their respective drivers before suspending, the suspend
> wake sequence works just fine.
> 
> Could this indicate that the issue is related to the media clocks or the PHY
> during the suspend/resume sequence?

That might be useful info. Assuming there's a dependency that's not correctly
represented; You need to turn on power domain X (or its reset or its clock or w/e),
before power domain Y, otherwise power domain Y hangs, it would be a good next step
to find out which power domain X is the one that if you leave powered on during suspend
doesn't cause the hang.

I expect that if you take the imx8mp-blk-ctrl driver and stick an return -EBUSY into
imx8mp_blk_ctrl_power_off(), you should be able to suspend/resume cleanly (with all
DT nodes enabled and drivers normally bound).

Afterwards, you can bisect the power domains to hopefully find a particular power
domain that if skipped lets you suspend without hang. With that information,
maybe a better solution can be found.

(I am interested to hear if I am missing an easier way to do such a bisect!)

Cheers,
Ahmad


> 
> Best Regards,
> Advait
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

