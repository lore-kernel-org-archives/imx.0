Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883951103
	for <imx@lists.linux.dev>; Wed,  6 Sep 2023 08:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721C9C433C9;
	Wed,  6 Sep 2023 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693987355;
	bh=zmyW96oufhW8RAznv87Q91mLlrLwARrAfGvvOlVq0TI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IL5+fF4+1Fzxw4zM82XIzY78DaaIqIEwbkAXk8L+zouzHd3P7qLSEW7l3CEqFNIQm
	 xEgvdbXTcVg6EUyXbpJgX1DHGfoLJu1HUC1LqHOwvBOS7FOwFtVkST7Fg05dzmPJMJ
	 7WHHD+i+UkHbhtHQ+IzO43jmCj5jvjeG6H9UK2Dr+HmLSLJ5krhKKf0b1y//cc1QWe
	 WybiZ+iB/14BasD5RiAbK/AHyuj77MczJ14Zz7d7jQ4Dj4jsl1YFzinJUtc4cxMDCx
	 TgJVHecDppIQUJRaux6AKDq+dQfTyI7Q+YXHENS8HiDWcvTEHegsRc/Myr8rcIC8bT
	 gs4GhpoyBL1hA==
Message-ID: <2ee5974b-a8a9-0c6d-3f59-7cfedaa09c55@kernel.org>
Date: Wed, 6 Sep 2023 10:02:31 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 8/9] tty: serial: add tty over I3C master side driver
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230905213842.3035779-1-Frank.Li@nxp.com>
 <20230905213842.3035779-9-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230905213842.3035779-9-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2023 23:38, Frank Li wrote:
> This is master side tty driver for tty over i3c.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Why do you skip Cc-ing maintainers?

Best regards,
Krzysztof

