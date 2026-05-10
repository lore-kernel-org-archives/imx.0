Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588635C181;
	Sun, 10 May 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410114; cv=none; b=LLUZHJBxC5OfTnNxIlvZcw7iyZznUYgOZGrpipFfKjX4xt7dze7kBgb2L3Eg61OegF8/dCZtjXtYRjjtyj1RhcN3yVcSyctiK242IUY8hoy31kJkqlaotdH09Frj3bu3pwWmvDHplB0r0lea8UDnzBEApTOGyNji1wITjJ2jULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410114; c=relaxed/simple;
	bh=yeELburbxkfR8IuJsc2BxwtJBU7YBrT4ytnwWTV+ZUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sGPonKEjOzrcDmmBk5QwQwDLdENy/y529rxAQGf9IDbe4wHwhsDFzUHrMk13xNJ2W5pCx5WLFHmZliX74vGqJEuo/bHcUNhdK2RzSkeN+7wEvNhQ6xmrKJx1+7Mb6a2Pfi1VsBuuwG1/NMIyR+aHlRLCApUKvRML4lWqNJOsjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3xj4XT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3xj4XT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA23C2BCB8;
	Sun, 10 May 2026 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410114;
	bh=yeELburbxkfR8IuJsc2BxwtJBU7YBrT4ytnwWTV+ZUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=e3xj4XT+MdsW+jaTa9xtmYWkqvzE3VMh3VCtNLNr8sscDKq3mcY7YpqgcP4iM2+Mz
	 1ir3AoKVS/GopWq9T5Lo4dtrfIiRYfpswWQ0BX/kE2eFC/BkCE0YqPSP5yeojYMR9W
	 yLkMQuqcKSAfdZvELQLNBiLvvkF+kU6D5hqp6tiBK22TwCBUT/JG0BIJJsRIIl+NdS
	 4DfSHTmPEh/ZGlRJ9p7gLRVGjtu3BI3COyjrvGMcRFcDcq+xzsX2h+q9UUVZyENSgE
	 3syDC2iwtUPOpqYA7xnnBGPINQbqCS5l5Ds0HHS/HYRsFVx5GZCkkxQFmtH6JrRe4Q
	 uIz9u8r9iug2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 05/15] net: enetc: add support for the "Add"
 operation to VLAN filter table
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509102954.4116624-6-wei.fang@nxp.com>
References: <20260509102954.4116624-6-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:33 +0000
Message-Id: <20260510104834.3FA23C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing dummy implementation for `ntmp_vft_add_entry` when `CONFIG_=
NXP_NETC_LIB` is disabled.
--

commit 5e0769b9fed651ba9fec062f5b68e9fec7739814
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add support for the "Add" operation to VLAN filter table

This commit adds support for the Add operation to the VLAN filter table
for the enetc switch driver. It introduces the ntmp_vft_add_entry helper
function to facilitate adding entries using the table management protocol.

> diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> index 4cfff835954e5..3672e0dc7726b 100644
> --- a/include/linux/fsl/ntmp.h
> +++ b/include/linux/fsl/ntmp.h

[ ... ]

> @@ -125,6 +147,8 @@ int ntmp_fdbt_delete_entry(struct ntmp_user *user, u3=
2 entry_id);
>  int ntmp_fdbt_search_port_entry(struct ntmp_user *user, int port,
>  				u32 *resume_entry_id,
>  				struct fdbt_entry_data *entry);
> +int ntmp_vft_add_entry(struct ntmp_user *user, u16 vid,
> +		       const struct vft_cfge_data *cfge);
>  #else
>  static inline int ntmp_init_cbdr(struct netc_cbdr *cbdr, struct device *=
dev,
>  				 const struct netc_cbdr_regs *regs)

Does this need a dummy implementation for ntmp_vft_add_entry() in the #else
block?

Other functions in this file have a static inline stub when
CONFIG_NXP_NETC_LIB is disabled. Without a stub here, configurations where
the caller is built but the library is not might encounter build failures
due to an undefined reference or implicit declaration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D5
