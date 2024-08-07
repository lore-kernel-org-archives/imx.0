Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26C1EA0BB;
	Wed,  7 Aug 2024 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038873; cv=none; b=AvJygKnJUauptuUAYvW/m8qp3V1dWdUfMW35mw1Vwqgh3piuuk8o+7v3lKp3ga8FG5ijbZy6oBF2KfcURJuqnRyNBelvcb0vHlulyi7evShiiZ0MFRamlH5dgyytircm9yK/PGF2oFtUte+I8l55kWsYwLKD3YSyBZlc7tlaj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038873; c=relaxed/simple;
	bh=GvuZqk+nWjfmHuCpg+mSjntQq2pHvfaGFNAy1jA1/pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xf2ruQC9r5psK9+RNu1+ypFVdTRRbyTHbAiYm/7l2DKBxW2AWjf3at/MdpHUpbK74lI3hPnwFMHL/EZj62AAIM1aHldolcuT1b2iAEGrwftWwkWw+UCTXhNA4fMN7rKcSkwFHqLsE8yvpP30N1cdzwanNB6YbyxTgEmlKMeDN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jncAV4WL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jncAV4WL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=fgXKy0mwAdl3KwNMF9A5aO1KpxKV1Rnwm5kXhRfF+2c=; b=jn
	cAV4WLHkoAXAeoqieAXrwRVXXgLGR8mZmwRr53megJSnel3fGC/q6Zr93P/WNHN0EDNoCWqiNi/UD
	e5EwraLCGOCYh3ZawOkitqqDvJ9ZyfHWO3wHeg2x729nNLeIlWyq9gNXBMp5VlSDDBy8PG6MvbDEP
	uGveH4PSM29Dyig=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sbh7V-004Cro-69; Wed, 07 Aug 2024 15:54:29 +0200
Date: Wed, 7 Aug 2024 15:54:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH resubmit net 2/2] net: fec: Remove duplicated code
Message-ID: <cd12c7fd-ec72-4bf6-b55b-764244fb59d2@lunn.ch>
References: <20240807082918.2558282-1-csokas.bence@prolan.hu>
 <20240807082918.2558282-2-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807082918.2558282-2-csokas.bence@prolan.hu>

On Wed, Aug 07, 2024 at 10:29:19AM +0200, Csókás, Bence wrote:
> `fec_ptp_pps_perout()` reimplements logic already
> in `fec_ptp_read()`. Replace with function call.

This is a cleanup, not a fix. So please target net-next, not net.

    Andrew

---
pw-bot: cr
