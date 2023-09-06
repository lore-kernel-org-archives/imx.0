Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB52EC7
	for <imx@lists.linux.dev>; Wed,  6 Sep 2023 08:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A794C433C7;
	Wed,  6 Sep 2023 08:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693987306;
	bh=lnZrIvfAWrPfKvf/5nuj4+NDBonPVQoFp84luU6Fq5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LqB9YfF/yrQciqfqUZOI2RVJ2mCkio2FAi4dpXTWKwuGIQivDc+V5/vaXkUNvFf+S
	 VlDevJQu5Z+p7/8lwpxmN3pFnL0PdVOG32Ytq4tqZ92s1rmsSg4g0/eO6aySRvrhXZ
	 06ACuLKe7XEPJNL2Kta/l0kHwG5eodZ3moIjrlO3Yg6c4Yyw8W8yzwle+qu6DVlBsa
	 vYOLIPhqTRxQbTKW90mouYQPoY7DZ9HgCei2PA7HPPAuORNFjcswuD/Q7yzArr/ImU
	 1Cvtbvmjwz4rRgwtJ/VwKTLPRMnGpaIV2xwIKRDuXRJ+0950sAl8t6Vh33Isz2a+c+
	 c/X86VpNP91fQ==
Message-ID: <e9880548-11c5-2790-7c77-7ca031849182@kernel.org>
Date: Wed, 6 Sep 2023 10:01:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 4/9] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-slave-v1
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
 <20230905213842.3035779-5-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230905213842.3035779-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2023 23:38, Frank Li wrote:
> Add compatible string 'silvaco,i3c-slave-v1' for slave mode.
> 

No, it's the same device.

Anyway, this was not tested.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time, thus I will skip this patch entirely till you follow
the process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof

