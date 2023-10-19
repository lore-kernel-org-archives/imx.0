Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAEB30F82
	for <imx@lists.linux.dev>; Thu, 19 Oct 2023 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UYBi5Ia4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907D1C433CA;
	Thu, 19 Oct 2023 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697729939;
	bh=AREkZrmSccQRuZ4xGIzEq28d+dMWO3ytqI01nPqGsxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYBi5Ia4cNzwlQhZHuxcog/XnJeh+GxvXj3dDk7kRzJ545iYDy0kSx0QGHXiUuz9f
	 8M7ojGLcm1HjqBDTsaffw3GAYXKBaczOF1RGbSjqGMgks59s9Nj4Wx1jdRPMtdDFpR
	 DdSO0z4pBuRnNKlSMUjDKY22rosC2Cj5KT1NJ3QA=
Date: Thu, 19 Oct 2023 17:38:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
	miquel.raynal@bootlin.com
Subject: Re: [PATCH 1/1] tty: i3c: add tty over i3c master support
Message-ID: <2023101906-rimmed-unmarked-0ba2@gregkh>
References: <20231018211111.3437929-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018211111.3437929-1-Frank.Li@nxp.com>

On Wed, Oct 18, 2023 at 05:11:09PM -0400, Frank Li wrote:
> Add new driver to allow tty over i3c master.

As Jiri said, you need a lot more description here before we can even
start to review it.

Please fix up and send a v2.

thanks,

greg k-h
