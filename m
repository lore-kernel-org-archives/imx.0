Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F7022D7B5;
	Tue, 30 Dec 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103385; cv=none; b=I6MiFSdGUQaOiyjadEu92+ZgcgTLVJO45TlY7xIX8eZk5MsYSqiYT7W9Al31KI3kDUoMPY8dNR7yy3nd7Y8ELj5lmfk2/AeCjtDKGJQYP856WiEW5d+rWEV9u62tcVxS8irlxnqk0DcNoJbCPV3NLXuhtxNH+is0v42UFObXSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103385; c=relaxed/simple;
	bh=raQ+aIj5zTbQo9xbxfVUWk8ldDoS4WvR8f52e8Z21kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3ICOMS3meRuYEJ2rZiaFouCg940d66v++S/0WicPfsL53D4KebEyWBe0AFixn0eiseaFHvQA4VDOggNRrdSkYETAYe9eMfQ7XH8HFIk/GUjLD2tMCoWXz3570zSf4acLTIEuoSDdqyikEC7/1k3YMfQ3AG/QbRXHknk1zQ9g8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o79gpZfp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o79gpZfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7FDC4CEFB;
	Tue, 30 Dec 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767103384;
	bh=raQ+aIj5zTbQo9xbxfVUWk8ldDoS4WvR8f52e8Z21kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o79gpZfpMKLiCHbQz2Ut031SQXP7gfIxkjF3XNkJE9M6xOs56AdJhQOgY3fPzTFyh
	 XSHOpTnrqeUCoLqZsaaxCKDZIX5rOiek6+z3BgvTkPHZK7KbxAtVuAd45cCp5B+0Fz
	 cBZ9t/XClIJm+rwVqrxcsuyy1VBqhpVciDGgIeJQP55kkqtCsilTf3Abm4TsWUYavg
	 YuzTnXANhJQgeHekn1KCgDLamvv9cDvylyFbikIcs8z6YxUSmR15GdgNSJwCiLf/Fx
	 rvse78zFrovBbzdHKMzHyQRFtW4j1eV9BZi6Nrp538+Ebta4T/iacAq6lRhObMF2Xs
	 hTpRXdkfJqgEw==
Date: Tue, 30 Dec 2025 22:02:55 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: imx: imx6sll-kobo-clara2e add JD9930
 regulator
Message-ID: <aVPbjxxXM4nJt9MS@dragon>
References: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-fp9931-clara2e-v1-0-e5b1cb79330a@kemnade.info>

On Tue, Dec 23, 2025 at 10:34:01PM +0100, Andreas Kemnade wrote:
> Andreas Kemnade (2):
>       ARM: dts: imx: imx6sll-kobo-clara2e: add regulator for EPD.
>       ARM: imx_v6_v7_defconfig: enable EPD regulator needed for Kobo Clara 2e

Applied both, thanks!
