Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C2311C20
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494524; cv=none; b=rZGGkU9S/98tbeWb/blQuDXlUKA8eRgsQkEyWrHWbnc03KGfVkAHgBnNolwXUWZBtDD5UEDjvLuaU+lzW4UP9qlBzkiO84JmtAQVJL7G49JonOGMzMN97vsndnXSK8tQ4NUeiKueCKtNXIv3Bq0kmspovkJW5o6+m/LJEVp4PYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494524; c=relaxed/simple;
	bh=hpz41grSZgUpOdZSDvGHF3rBgqGglK7gcLfkEeaB+OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAgBhtZ00be5lWwQ6d+5JabP9IVRtNZ4rUOk6aaEITllHDf+nQDlSC1vWozyTCx5AmCxz+V005319ow6se2hQ0yg3AsY7hKrKG7fdw4G1JMmr0Xl4LuiFQEAoLC6l3fpMb/Z2Zz7ZD/7dKGEWPOzGGRFnxpbPCkRo987psXBwkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gEF7w8yg; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gEF7w8yg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jupNrTs3JMwOvq+fnMPXFS8hLrrLD5lrJLhDJBoxSEs=;
	b=gEF7w8yg+1iuLMmCraMdsagAWxzGsodzN3SjBWGYTGKuazSL3IiqlmafGSKxv2
	U04fsQYvnREEFhAy67GKLLdbYWIAIKqTwYpMuNzO9sK8C/wpK7/DiNu7eRkl0OVh
	Onuc4N9A7sHAluvCbYd4gNNnsgrIdrKZBvVoxugTjtQgI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3P987OsFoZf5EBA--.43160S3;
	Wed, 10 Sep 2025 16:43:41 +0800 (CST)
Date: Wed, 10 Sep 2025 16:43:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	mathieu.poirier@linaro.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <arm-scmi@vger.kernel.org>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <imx@lists.linux.dev>,
	"moderated list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <aME6O29QxvU_PcRx@dragon>
References: <20250718094723.3680482-1-peng.fan@nxp.com>
 <20250825082154.GA26152@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825082154.GA26152@nxa18884-linux.ap.freescale.net>
X-CM-TRANSID:Mc8vCgD3P987OsFoZf5EBA--.43160S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw45GF1UZrWrGr47CrykXwb_yoWfJrc_CF
	WxJr9ruw4agw4Ik3WrtrW3urnrK3y8XF1DXr1Ygr1fXFnxArZ8Z3ZxA34rAw17ZaykXFZ7
	W3Z0qF409FyDujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUfMaUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwLEZWjBF1101wAAso

On Mon, Aug 25, 2025 at 04:21:54PM +0800, Peng Fan wrote:
> Hi Sudeep, Shawn
> 
> On Fri, Jul 18, 2025 at 05:47:22PM +0800, Peng Fan wrote:
> >From: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> >BBM protocol supports a single power button, supported by driver
> >imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> >using linux,code. Add a reference to this schema and add linux,code as a
> >supported property.
> >
> >Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >---
> 
> Not sure which tree this patch should be landed in. But would you please
> pick it up?

I do not see the patch in next-20250910, nor reply from Sudeep
indicating it's been applied, so I just picked it up.

Shawn

