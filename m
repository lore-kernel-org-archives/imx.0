Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC021F3FDA;
	Tue, 21 Jan 2025 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472097; cv=none; b=NSMIORHtGl7b+4oORdpclt8Gsm/dGmp1tZ/OzI/dbZFv4ihjF6G1AEwucNTYJZwHvDCXmuvjNyot+4XDA18ezmred6iTU5Vlkk1PKT0ypVLwgXJwDGQd3mrglDAkuCheyDyzejyA3xxvrhv7xT2/IiePp/nmKA4qb3Iw6C3r/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472097; c=relaxed/simple;
	bh=g1QO5SCpQ8AqJrVfLyuS9U9W3JEEJTUZ72Ub2BUfEdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xbn4Ff0nFkFZsflCYl7i9DJJ//FNFUlCRnVnZxCYmqKQMbb4PsOv6JtakrvqD7pPWuQGta072fdAvrGoOpTfuky4tP1Rf5jAxQQBCRPMGSP0RhC/7k/BnF4K1bP4gOyI6hCdtuxHqOBZ3KubtJl/GHcpDn46I1cmXXgC8sgbQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vMKUtvAl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vMKUtvAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A214C4CEDF;
	Tue, 21 Jan 2025 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737472096;
	bh=g1QO5SCpQ8AqJrVfLyuS9U9W3JEEJTUZ72Ub2BUfEdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMKUtvAliXgips3CGbLmM8bekWXvkQlo2qjXoZn1gT8j9c3+uUJbIavcSnynMTgZJ
	 rCR0L+ffd1F4D+BK1MDuyyWf7pRQny3Wyey8Lfs5VCGrRboDjJf5cHxCV9fQ3egOew
	 JGwqEru1gmidpzev2o9Hgxr0HmVwacHMXw7rlE8w=
Date: Tue, 21 Jan 2025 10:08:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave
Message-ID: <20250121-military-helpful-polecat-9ba567@lemur>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <AM9PR04MB8604228D1E99ECB45F8E0BAB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604228D1E99ECB45F8E0BAB95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>

On Mon, Jan 20, 2025 at 09:18:11AM +0000, Pankaj Gupta wrote:
> Ran "b4 send --reflect"
> But it sent to all.

I don't believe it did, at least not judging from the archives:
https://lore.kernel.org/all/20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com/

Note, that --reflect will populate the "To" and "Cc" message headers, but
won't actually send mail to those addresses.

However, if you think you found a bug in b4, please report it to
tools@kernel.org.

Regards,
-K
