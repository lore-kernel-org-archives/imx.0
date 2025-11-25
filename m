Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BDE55A;
	Tue, 25 Nov 2025 00:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029728; cv=none; b=Z9CfEcw5rIpI/k25wyt4IoVfySqvDT0TYIiItg2yDZUm4aC1UPPcNWAL8Nhr7hMTGtdeMpOrywONHxnNnk4fFtyoFVqIxxbA7XHBkikVwkV4mRm+KcYxEgmMjD2PXQlL/wy5b7c8e5Ei+DBMJ01SuQixOxFh7YxTahthsMVQeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029728; c=relaxed/simple;
	bh=YTzpiy5MN0nSmnPal7DuYEEWhYSKlupN/mzasg5lSho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6aNxPxlP9cInM2WyEvogx5kjmhM4XETkaw85+9poPG1GH4x6YhMgdOHVWtmuIHQAjcLzLADE4V88NReWnfZhWG8yzWpiHimGKp6CcvBflMU+q5w2B2WkboxUsYLWhKDFmkrGr7KL+oEXUTbSd2ROVkDZISewa8HwfvCYvWZN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=wZ1DsvW9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wZ1DsvW9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QyuKCeP41T0RhPLm1wR6CXJW1I3cW2J3OinYCkHlCUA=; b=wZ1DsvW9la8UgZWAaiXuSHzST4
	z1S07IxHiik6Yuv+/Uv7sn6kcoTV3R8/+AHaP8hD0NqhsK756/W3ib2oICaq03/DQJlI9cslEIlT8
	CXYCuwbYE5FZDfWJ5vzhvzg/f85RBc78Ha5Itgyu76Ma7I4A+j6qAl0U2TAYy/IQZjcs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vNgiA-00ExVk-3k; Tue, 25 Nov 2025 01:15:14 +0100
Date: Tue, 25 Nov 2025 01:15:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"dongas86@gmail.com" <dongas86@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>,
	"kernel@dh-electronics.com" <kernel@dh-electronics.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux@ew.tq-group.com" <linux@ew.tq-group.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
Message-ID: <10502960-d426-49fb-aabf-dc62f11153e1@lunn.ch>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
 <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
 <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
 <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>

> But how about the remain changes (drop invalid defines and adding new ones)?

You should probably make these separate patches, with good commit
messages why the are invalid, and what the new ones are useful for.

	Andrew
