Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA716132A
	for <imx@lists.linux.dev>; Sat,  9 May 2026 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778326996; cv=none; b=Sex+7Hkhf8JtxE43sJPmyCfIKOE1cxhgQrMfwt6tiG76S4Nh7Fn4c8g3Ms11YAJOkYZKjr/XP+8sdOVF2RuPs/s3nq647+cSUuu67LtPIEP5EZp81ETQIstKVy2Ta2Qm5BYpLRu9RBu7ewM6W3RX3yy0yfFhwMvMAb593pLfNgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778326996; c=relaxed/simple;
	bh=MkVDdLk2EUhwA3kYOwNdRssZ8DR0K5p35EMw+/hFdoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BwmTCCwIeOf2/ABlbnm3tA3mmJ4HaL7Q3ZLy9pvpvUXMvQRSlA/n4tRSmp8ISPTMVAxZg0myuzncQi6yrMT+1UgeybakdCxpkcJzHadA/3p7PqIInGI7ZxGBMbfFvXmHPNeJ9lCv2d1XVWCy70xF6ynnNeiag6anB7JxUtm5gAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhkEyGBU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhkEyGBU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B4AC2BCB2;
	Sat,  9 May 2026 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778326996;
	bh=MkVDdLk2EUhwA3kYOwNdRssZ8DR0K5p35EMw+/hFdoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LhkEyGBUNW1aIT9+tc1bDKb9A5x0vRqTNBXDK1GMKpXIreXD/fb2exSLoRwqI4BFU
	 gLuIPshvAhja+2A++7UuZ7YsJtajaNx/0dVHU++x0QFT44y6m3A+l00ZVHC/SiXGtq
	 QPgntMZnBYXuMYE/QJzzjgxI9wIRFKDLFGiowysTMtvSgSfMIqkubMSQg19rNscv8p
	 lbnMAq7XT097+5FjLii6U8lRKqt2b5AV5Gz3XBG+g8aJKa3oSYWmKdOVygdgQq0Ac9
	 bLXbczO05vm5HjSB161x9apVVFge886+2Givch7f1IOn9wo+ycze3jeNrqryGQMDwq
	 IC6X+HVAqcDJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] driver core: avoid repeatedly printing the same 'Fixed
 dependency' log
Reply-To: sashiko@lists.linux.dev
To: "Xu Yang" <xu.yang_2@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260509111728.4123331-1-xu.yang_2@nxp.com>
References: <20260509111728.4123331-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 11:43:15 +0000
Message-Id: <20260509114316.13B4AC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving `pr_info()` into `__fwnode_link_cycle()` causes log spam =
and highly misleading dependency cycle logs during initial cycle detection.
--

commit b7864d7a5daadca2b750e1e3f78ba9cec6f247d5
Author: Xu Yang <xu.yang_2@nxp.com>

driver core: avoid repeatedly printing the same 'Fixed dependency' log

This commit attempts to deduplicate "Fixed dependency cycle" logs by moving
the print statement into __fwnode_link_cycle() and gating it behind the
FWLINK_FLAG_CYCLE flag check.

> diff --git a/drivers/base/core.c b/drivers/base/core.c
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -127,7 +127,13 @@ static void __fwnode_link_cycle(struct fwnode_link *=
link)
>  {
>  	pr_debug("%pfwf: cycle: depends on %pfwf\n",
>  		 link->consumer, link->supplier);
> +
> +	if (link->flags & FWLINK_FLAG_CYCLE)
> +		return;
> +
>  	link->flags |=3D FWLINK_FLAG_CYCLE;
> +	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> +		link->consumer, link->supplier);
>  }

When moving this pr_info() into __fwnode_link_cycle(), does this cause the
log to be printed for every intermediate edge in the cycle?

__fw_devlink_relax_cycles() unwinds the recursion and calls
__fwnode_link_cycle() for each link involved in the cycle:

__fw_devlink_relax_cycles() {
	...
	list_for_each_entry(link, &sup_handle->suppliers, c_hook) {
		if (link->flags & FWLINK_FLAG_IGNORE)
			continue;

		if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
			__fwnode_link_cycle(link);
			ret =3D true;
		}
	}
	...
}

Because of this recursive unwinding, won't this change print the
"Fixed dependency cycle(s)" message for every node involved in a newly
detected cycle, rather than just the specific link that closed it?

Could this lead to more confusing log spam by flagging older, valid
dependencies as the source of the cycle?

[ ... ]

> @@ -2140,8 +2146,6 @@ static int fw_devlink_create_devlink(struct device =
*con,
>  	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
>  		__fwnode_link_cycle(link);
>  		pr_debug("----- cycle: end -----\n");
> -		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
> -			link->consumer, sup_handle);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509111728.4123=
331-1-xu.yang_2@nxp.com?part=3D1
