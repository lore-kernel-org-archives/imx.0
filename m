Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A4831C57E
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511020; cv=none; b=Q1oELZdcm312qHCcu0UdQWJUOVt64HUVL9Q27DDORRSbnVdvwIbjFWTV+nwGJPQnumJ3CPFIPMgWs0Ea0szj9JbfhFcIP3sE8brr8j4eU4KyG22SR9JGYK+o4vmdNfjrgGcbhk3Ef2XdLoIuIm4cqbX6I55PkycpuZgDic2G5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511020; c=relaxed/simple;
	bh=x7ddNJB4PbEZlaZxFw8Q4jEczKtBC3VpbHxRUgvDWr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slJ1p4AT5u27iOiAuEfR3F0cQy7soa3KufMOl0/AGGQ2jywT40iXZfw0G5tp9k9Ovz34w1h54zV98FLh2P4UYe9R0tZooZogUfc4F9088Mdjy9+hzIB4iyBqxW5T9GvprDZo1uCzd/0vAFWTPjdlsj+FMtbTwhw0MVbKV/qlpAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZIAzvfhu; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZIAzvfhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gYMy2/LLnu2KAOtRSTu6UdjE6ow6Rx7TsQICVL6w6ak=;
	b=ZIAzvfhuS9W0YBFZsT9WvS6RE8IPbvsze8s+ZRyqDugfH9xf7UFC8g+knCJUnG
	aF/2I6Gzh/IJMhoVX9d5cY6KRJd4KSiVnvWgUIeuKTiPnuH/u3sLM6cZZtLUbZ8N
	wmxbLczxBZoPFGR3ICF7zumWrkip+kq6psJO069//eR9w=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHddlIfcFo5a5YBA--.43536S3;
	Wed, 10 Sep 2025 21:29:46 +0800 (CST)
Date: Wed, 10 Sep 2025 21:29:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Rosano <andrej.rosano@reversec.com>
Cc: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>,
	Andrea Barisani <andrea@inversepath.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 2/8] ARM: dts: imx53-usbarmory: Replace license text
 comment with SPDX identifier
Message-ID: <aMF9SKDEu4dlq_Xe@dragon>
References: <20250814-imx-misc-dts-lic-v2-0-faff7db49a5f@prolan.hu>
 <20250814-imx-misc-dts-lic-v2-2-faff7db49a5f@prolan.hu>
 <b48844bc-07f3-4fc1-8486-8968bf6d2362@prolan.hu>
 <aMFofaIczqElAsLY@stjenka.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMFofaIczqElAsLY@stjenka.localdomain>
X-CM-TRANSID:Ms8vCgBHddlIfcFo5a5YBA--.43536S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr13Kry5Zry8tF1rtrWfAFb_yoW8Gr4xpF
	W8KF4YyF4UJ3yrGa1j9a1DZ3saqw4fKFy5AryDW347Zrn8Xr1FqF4xKry5KFy29r1DCF4j
	ya1aqFWSqay5AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jYpBfUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgz8YmjBfUyqYQAA3j

On Wed, Sep 10, 2025 at 12:01:02PM +0000, Andrej Rosano wrote:
> Hi Bence,
> 
> yes, we agree.

Andrej, could you give an explicit Acked-by tag for this patch?

Shawn

> On 2025-09-09 Tue, Csókás Bence wrote:
> > [You don't often get email from csokas.bence@prolan.hu. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Hi,
> > 
> > On 2025. 08. 14. 9:47, Bence Csókás wrote:
> > > Replace verbatim license text with a `SPDX-License-Identifier`.
> > > 
> > > The comment header mis-attributes this license to be "X11", but the
> > > license text does not include the last line "Except as contained in this
> > > notice, the name of the X Consortium shall not be used in advertising or
> > > otherwise to promote the sale, use or other dealings in this Software
> > > without prior written authorization from the X Consortium.". Therefore,
> > > this license is actually equivalent to the SPDX "MIT" license (confirmed
> > > by text diffing).
> > > 
> > > Cc: Andrej Rosano <andrej@inversepath.com>
> > > Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> > 
> > +To: Andrea Barisani <andrea@inversepath.com>
> > 
> > Andrej, Andrea, do you agree with this?
> > 
> > Thanks,
> > Bence
> > 
> 
> -- 
> Andrej Rosano | Hardware Security | Reversec Foundry
> www.reversec.com/foundry
> BDE1 62F4 7020 1588 8046 AE02 EA17 8C32 AB56 54CE

