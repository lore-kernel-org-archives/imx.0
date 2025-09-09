Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30B273F9
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396760; cv=none; b=czJqixADdMyiaocIFlMLk3h5Sc4NSHdiTocjDRl+fB8DTyogwu8Ayn5dhUtRWoXsIUkBUHLw4FVt1TvKUtwxHIoQ9R4omLO60IMY+2/3TyaCrDv1zzPLuZqFdwVHvlC66tr8+Gp/pZ7RyS16t2Tlhf/kkOsQfmw97Y10BhiKsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396760; c=relaxed/simple;
	bh=yJ/Rw85OvrNUxbRZVTZePsmYWNdIjtDRbL5OuuCOY9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QBt+/bpUYlLC1MAsBmUh4yqPLI2NV+Z/iJ68BCSxgyurKmP8gTTbEhIlZ/ljgvLDWzTOa815mQVMMpu95TXZBEauFRtFMZ1scGrDhKc61id9vPl/pV8EYBenYZsBDNrz2u/nsUnOKUz6zbNhL0JVr7HDg1hbZeBCTr/JOJYeMlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=uUz7NHrn; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="uUz7NHrn"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 1F941A075D;
	Tue,  9 Sep 2025 07:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=LkLVFVapCS9rw4tYTMr2
	CibTaZYukraHmu1rfU3DbGs=; b=uUz7NHrnIBGmHpnIKXyOM4UxmmFh1Zqu9t1h
	yVIROpTaOy+PFq5XcYYX8S6My57dyRzoDaQz5I11Sf6PiXYfl/Vgm19GwxUxS9Di
	XX30dMJEY7bc1D62Q5ZwqqBu3t28TbjkkEbTavu4ufdGyeqdcVaGs2qg//mz6XMD
	s6kSKSlwG+nJoltHJ3wG17NUEVYHK3yq3LzAkLnUvCenk07Nknc7Rjz4kD+EDa5e
	miZQT2aNhxZBrL7LBD10iOUTDHqoolrV6qNkGVAfD8oAbLeDUiB4hWXd8LeaO7tn
	k8LIZknlVpswq6lOBXwlunn8ZxgM1uJsMi+sJ2bavoA3wPCDzve+rP/poyb6lOPo
	mPMifIfgeFFK3TFMq3p/nR/EFQmyBka3CH1t43icEJgIm3XxjqPrDBCsf3rI0OoA
	tjo0BQov2cUEx0ubZlmHyMQ9nLDvApq/thofET/rdmhIDAtv531FbVkJlZcBxJsR
	fCJST1vm21JIw1NHlT8fmB6z88JwtoHFQfN5kBqGFOYLn2Y3le9CWxFV69cD8ccN
	T9K1+Vgxp7S0XNncuAacseZnLqMRWCf0OC8dTtCAoBjUCP/tvBz+dcFh6GcogzAp
	kuW6n7gBwY1iibfT4UuZ7kfvTJF09Gz7SGOwDicACUZ9GBc+9Gq/o9VIe4kd3TqF
	HcQ24zo=
Message-ID: <e79a6234-73ad-48f3-a3f4-3b05f309737d@prolan.hu>
Date: Tue, 9 Sep 2025 07:45:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: imx6-cubox: Replace license text comment
 with SPDX identifier
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250812-cubox-dts-lic-v3-1-1eb7ef334934@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250812-cubox-dts-lic-v3-1-1eb7ef334934@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: sinope.intranet.prolan.hu (10.254.0.237) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E627462

Hi,

On 2025. 08. 12. 20:39, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

So, Russell, are you happy with how this patch looks now?

Bence

