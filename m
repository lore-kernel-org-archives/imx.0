Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A53AEF55;
	Wed, 19 Aug 2026 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156457; cv=none; b=OnWC8UBXzqBgOGl5zXLlxRLLht1o+8jyDQuRZ7iOVj0Cm0+cc3W3FvytQMytmiVpkLa4NaISwtNjvPw+4Z1yenjbzBxNE6izIxR4BX5BiRdFqdI82MNzPWtzTAqM0BbWVt3RlwOZVN+C051QMPGqshgYXmy+wfwmi940jUBbnck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156457; c=relaxed/simple;
	bh=Pput8/gxMRI7R5sn8vz4bcfzfS3T7v6sD3oW39AVQzY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tnmjW799ZNUI+qWtq2F7KAgBSgbMSeMbaNTIw/kJzLilkFN8WVSMdgJ8jYzN+5msGtoRyV30eAXyQbJBEJpOGb3KGTdHaz2PGEtmQmqB3guMYPFaq7EZaIAXGoGhxqeG7AHJI4Pm4IXWM+naFumGyRbiFzgfuWSIOq07RxACs9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXqxzT+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXqxzT+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35F41F000E9;
	Wed, 19 Aug 2026 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787156455;
	bh=MsGBwTm9o3kf7hxWC58G1WHK/BNj7ffEVjFOrzql5G8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AXqxzT+IJvnwd1TZIiaBizG7IzEdNs4yuIGDAoWVzpvEnxbOYlEAvNp5QOmw+hNuf
	 Vq82/OnWiNnZOwQqjXrnmr6cYsFePJBHBMA5SrMvy/pQ/dyov0n7VxE6q3ca1z3d6/
	 seur1Jg6vALNvCslmHNS0YmBaLuVdptOTiRnzu6v3cb/qD9Q9BW2okPp19Gv6Jn/Lz
	 rJWdzOaeI4whB8HW6+MIzTq0JM7b+BTwzTuivGqu/e/Am5rJHgsyBqIz5RkwqnmivI
	 QLcANehBcPiDp6TmdmgqwR8pyQcK5GOG7Sc7XGmDOp4lskLn1/oK6VQKpr0SuO3cn/
	 ZySqH/9xEk4ag==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhipeng.wang_1@oss.nxp.com, Marc Zyngier <maz@kernel.org>, Frank Li
 <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] irqchip/imx-irqsteer: Allow building as module
In-Reply-To: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
Date: Wed, 19 Aug 2026 18:20:52 +0200
Message-ID: <87zeyijd3v.ffs@fw13>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 19 2026 at 18:05, Zhipeng wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> This series makes the i.MX IRQSTEER driver buildable as a module.

Before I look at the patches themself I'm really puzzled by this ongoing
'fix' irqsteer frenzy.

There are three different series/patches each addressing one particular
problem. What's worse is that this one and the one from Fabio are
conflicting.

Can you folks please stop bombarding me with this stuff every couple of
days and work together and consolidate everything which is related to
fixing this mess into _ONE_ coherent patch set?

Thanks,

        tglx
