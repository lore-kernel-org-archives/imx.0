Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290EA17D4
	for <imx@lists.linux.dev>; Sun,  9 Jul 2023 08:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02147C433C7;
	Sun,  9 Jul 2023 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688890009;
	bh=0TqUItfFmw9XF/dUbR/31TtViLA8sLj/7zXNb23mZIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXzP/SMt6ZkLRM7KekXOM/lUYUAP3pwnzXK0K6XdHQzzuQhRxR2nHjf/4du3NugaB
	 xOUip8Ebco5pGaal+y74mvIuuMRLIPDv2G9wTBuEaMG2PxjW8+lqwH1bq2FLCES+6/
	 1cjBeqx3ag9msu+V6KFAUVFyPMaAY36fQwZF1fWc=
Date: Sun, 9 Jul 2023 10:06:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org, imx@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Elson Roy Serrao <quic_eserrao@quicinc.com>,
	=?iso-8859-1?Q?J=F3_=C1gila?= Bitsch <jgilab@gmail.com>,
	Jun Li <jun.li@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Prashanth K <quic_prashk@quicinc.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: cdns3: fix incorrect calculation of
 ep_buf_size when more than one config
Message-ID: <2023070924-uncolored-bootleg-77d6@gregkh>
References: <20230707230015.494999-2-Frank.Li@nxp.com>
 <f803653c-8967-b187-8339-fbec0cdeef25@web.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f803653c-8967-b187-8339-fbec0cdeef25@web.de>

On Sat, Jul 08, 2023 at 05:18:38PM +0200, Markus Elfring wrote:
> …
> > The fix involves checking the private flags EP_CLAIMED instead of relying
> > on the "claimed" flag.
> …
> 
> Please choose an imperative change suggestion.

Please do not review USB kernel patches, the comments you make are not
helpful for developers and will be ignored.

greg k-h
