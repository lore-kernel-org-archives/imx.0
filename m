Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FB283FE5;
	Wed, 19 Aug 2026 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787156827; cv=none; b=FcUnlSNUo0kwbz8WvOr8Mr4dZNtPg1nR5UczeqRAzZqAUz4ZvbT10XIiFGowAxT78FlVAwori8Os3czyUgHvpXfxBivIuuoY367+375XIF9rhnYboNHYoJBNGuEN1YmiAF+s8opMfriBa8kiuO8QvPirDRIHeHp+FG+Hbx33fNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787156827; c=relaxed/simple;
	bh=getZyc5+x7C6K+sHXoqwvKs1rQBBDmmM1OthDhDSEaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VAigBC5PmmkB80n33uU4C8anwPihMUORYNfZMJa/wL8JlCGynObWK4TA+9MwRYQT7lamVnOxgMXBoE6J6whelwxexmjQG0OqwtaAtWlviYqs2+oHHWj4LS7KJpGo2WdqMvTCHcywUtG0dCG4fCnqX6pXOjRR7JxfaKJycDa+X8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGi5NJrG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGi5NJrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCBD1F000E9;
	Wed, 19 Aug 2026 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787156826;
	bh=tWum0M/KW01JsIfiqiWfjLWjFJsrmJRkwJ5RSvWc/nw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MGi5NJrGmu5soIJH5Y4TrPdyTM51X+j9qrW50n2sQen00EnBLtz542mV9BAc94Ln3
	 h3AcYJQAHPnc32dPj6h9l1oMevVZWUdwAIbCAaGCBZQJvrc3RPLTU9t6+LrUup+Z5P
	 7WSvtJFiSATKDUES3jhDs8AtEK/Tl/plnRiBgRlsJ9ORXPbzjdMzvBlTo/vZbWESpi
	 XwW9WqEubaSsAOUMbH84TiC8n5sIhGasJsfNDMpCrbpg1abAeh/yLm0K3G4zrD6E17
	 Q9ZaOZ8woeEk675NZKTAV2kN4ArP4SowdFj2hesX/YnhEIIeNm+n39XAnzT9U8aO2h
	 lTrsFrXulQhKQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhipeng.wang_1@oss.nxp.com, Marc Zyngier <maz@kernel.org>, Frank Li
 <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
 <jindong.yue@nxp.com>, xuegang.liu@nxp.com, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] genirq/irqdomain: Add
 devm_irq_domain_create_linear()
In-Reply-To: <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
Date: Wed, 19 Aug 2026 18:27:02 +0200
Message-ID: <87wltmjctl.ffs@fw13>
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
> irq_domain_create_linear() has no devres-managed counterpart, so every
> driver that wants the domain torn down automatically on unbind has to
> either open-code an irq_domain_info and call
> devm_irq_domain_instantiate() directly, or register a manual devm action.

I'm not opposed to add this, but adding this as a prerequisite for a
backportable fix is bogus.

Just open code the domain info in driver and use
devm_irq_domain_instantiate() for the initial backportable fix and then
mop up the thing _after_ all fixes are done.

Thanks,

        tglx
