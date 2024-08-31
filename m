Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9188E4A3C
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725109222; cv=none; b=ASd83SqxhtZEm/fVVEzzBzHZwvunIeZBvAFW+cZF+9CKQIyor8DgJgWRsvy/uVnyDNBl7X3VHQUMNZbLsLl653/fe3mCPYhSKiAdU/LdQDFnlkqZnFZjBca+CY8vVm0SZuJwH/grpAGZ5rlo8rj6EuDAAj5KyK677yVzjmM742k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725109222; c=relaxed/simple;
	bh=w659f6kqV/OR/UzNObajOpqSV64/Bzt1TYyuLmls+Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT5EZab0VXQYn8RtFd4nDLCQY/XQe9uBpw46csxpwwlY5KsAnaazP6qJo79KiqRw3pQGaZQenm9/FvSkKSqeLN1r6LvqdQP7qDsPWt4UbD8AEfLUMpoCxAOjZ6k4cM92O2bj3L2nzEQCot6b+Vc1GGUO2uI700klYHhCQFJnAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oS8vZfbE; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oS8vZfbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=W6rrmx0uL0jY6lwJcH1ACK0U7bPTNm0fVoJtP29xGVY=;
	b=oS8vZfbE6wByklYv2ot0QHTG/nuEASjtIh2GSbnF7yNLt8WI+6ZuHK7XWRHZ5C
	3STD1i0939IhFRgKuGtS8FMmuES2ZrVAFDbVsEnRVKLsDZxXtPGjy2VtdToEGd3S
	ST9jlSBhTOYcYrdMdjxk95DJ2lEweuhZa57Dz1xBCJj6E=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3X0nJE9NmJYk7AA--.10321S3;
	Sat, 31 Aug 2024 20:59:55 +0800 (CST)
Date: Sat, 31 Aug 2024 20:59:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: imx6q-pcie: Add reg-name "dbi2" and
 "atu" for i.MX8M PCIe Endpoint
Message-ID: <ZtMTybL79ui5ocPM@dragon>
References: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
 <1723534943-28499-2-git-send-email-hongxing.zhu@nxp.com>
 <172356674865.1170023.6976932909595509588.robh@kernel.org>
 <AS8PR04MB86767916B0539B339120C2218C872@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB86767916B0539B339120C2218C872@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CM-TRANSID:Ms8vCgD3X0nJE9NmJYk7AA--.10321S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWrXrWrWF4rtF1UKr4kJFb_yoWxtFg_Kr
	4Iy3s7Ar45Xay8tanYyFZ8ZrZ7uF4q93y5Zw1UGr1a93s8JF95XF95Gr4kK3WjgrWDWF15
	trnxXr1jgr1aqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8z6wtUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxdMZWbS-EksMAAAso

On Wed, Aug 14, 2024 at 01:49:30AM +0000, Hongxing Zhu wrote:
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> > 
> > If a tag was not added on purpose, please state why and what changed.
> > 
> > Missing tags:
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Hi Rob:
> Oops, I'm really sorry about that I missing this reviewed-by tag in v5 by
>  my mistake.
> Thank you very much for your notice and kindly help.
> 
> Hi Shawn:
> Can you help to pick-up Rob's reviewed-by tag?
> Thanks in advanced.

Hmm, this one should go via PCI tree.

Shawn

