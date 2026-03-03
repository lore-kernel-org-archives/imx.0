Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC07351C17
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557567; cv=none; b=apRMTGKLmyAehMWz0VvsDCPs65eyEUmSXNs5LTIuHAMdzRnAx6ugiR65XSGjQnlfRtYChewpMqaDEYWmK/MwQ7W5sMBII/9zJPH8JsgW6r0fNvqNgPp7CyBaRHH80cLYPW78FjkPmW850daAWJl6ztf4feR1qc2Ka8EVzo7BnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557567; c=relaxed/simple;
	bh=DLu3q9o3XmmE0oW7F+z6Mc4THjhnJnjhOxFhA8FxFEU=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=Agv5Xe3+DnsGq3v2m5jCmoowKOfew9BmDSzOc9OcWVXFTwycTZFvnhcu/L++p7v7xTEpwGrNTAk6a3k/Epte+UcK7mJZED+BsJ9zyN54evW7k4uRm7mb+rDdseJegm0iEfS3/L1v+ZJCZk8wFMYHiNEXSwRMzmIklL+QJaNQkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=pg6KN0dJ; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="pg6KN0dJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=dIABMziNLvW0jGN8kMlgpZrAq89Imgr046x+DRl4Rp0=; b=pg6KN0dJ5ZW2AM6cCDdSSbnuh8
	PhW6AkE7BgkA004hNmbRR18mGBAQhSx99q5o9AAXWurQ7v8cqZw4Sy816/wAn7HandtGwvps2gs9f
	Rqcam9kTr/6hJ0oAXcGwT8kAE04C11Py+CCOXtzokRwkAzZE0Z/Vid+3hcaJR9LmbvjM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:35704 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vxSWF-0003Ms-A8; Tue, 03 Mar 2026 11:22:47 -0500
Date: Tue, 3 Mar 2026 11:22:46 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260303112246.0bd6238aba7489b6de499299@hugovil.com>
In-Reply-To: <920740e1-5bbb-4632-a62d-325715cd8043@kernel.org>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-5-hugo@hugovil.com>
	<20260303-rational-thundering-firefly-9dcaa9@quoll>
	<20260303095533.1c6dff174f6c9d162d3e3303@hugovil.com>
	<920740e1-5bbb-4632-a62d-325715cd8043@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Krzysztof,

On Tue, 3 Mar 2026 16:19:54 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 03/03/2026 15:55, Hugo Villeneuve wrote:
> > Hi Krzysztof,
> > 
> > On Tue, 3 Mar 2026 08:10:51 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >> On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> >>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>
> >>> There is no Variscite module named VAR-SOM-MX6UL.
> >>
> >> VAR-SOM-MX6? And there is.
> >> https://dev.variscite.com/var-som-mx6/
> > 
> > Ok,
> > I was confused by the "const: variscite,var-som-imx6ul" and thought the
> > description was not matching.
> > 
> > But there is still no module named "VAR-SOM-MX6UL", but "VAR-SOM-MX6",
> > with different CPU variants like UL, ULL, etc. So I will modify the
> > patch to reflect that.
> 
> I don't understand what you want to reflect/modify.
> 
> Description says: VAR-SOM-MX6
> My link says: VAR-SOM-MX6
> 
> What is incorrect?

VAR-SOM-MX6 is ok, like your link shows, but not VAR-SOM-MX6UL.

If someone looks at VAR-SOM-MX6UL, they may think that the "MX6" part
refers to the VAR-SOM-MX6, or they may think that the "6UL" part refers
to the VAR-SOM-6UL, and it can be extremely confusing. This was my
understanding at first, and the reason why I submitted this patch.

If you look at the associated board entry in the binding, it says
"const: variscite,mx6ulconcerto" but the VAR-SOM-MX6 doesn't use
the concerto board. It uses a board named "VAR-MX6CustomBoard":

https://variscite.com/wp-content/uploads/2017/12/VAR-MX6CustomBoard-Datasheet.pdf

The VAR-SOM-6UL uses the concerto board:

https://variscite.com/wp-content/uploads/2019/07/Concerto-Board_Datasheet.pdf

So the description in the binding "i.MX6UL Variscite VAR-SOM-MX6 Boards"
is wrong, and needs to be replaced with VAR-SOM-6UL.

By the way, support for the VAR-SOM-MX6 is provided by this binding entry:
   - description: i.MX6Q Variscite VAR-SOM-MX6 Boards
    items:
      - const: variscite,mx6customboard
      - const: variscite,var-som-imx6q
      - const: fsl,imx6q


> > 
> > In fact, I will modify the description to reflect that it supports both
> > VAR-SOM-MX6 and VAR-SOM-6UL modules.
> 
> Are you sure that it does?

With my new research, as explained above, this is not the case. I will
modify the description to reflect that it supports VAR-SOM-6UL modules only.

-- 
Hugo Villeneuve
