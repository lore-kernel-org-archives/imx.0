Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53416480320
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077319; cv=none; b=SHujzg8+SNQm4T29M0RerxKxGNfCkvJr0uN0oS3mniyaXF2gmtmN3eSDZp9EAcAAh0aS9c7dgJLEs3tEPG3ofqBgh0ZhYGdS7Sp0VFNEqtylRMlCuqdJO+7Qehblq5hNxqPbFthVWIwTumhkCbGZCWu+qRLbMucwiwRtz4jh8ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077319; c=relaxed/simple;
	bh=0Uq1YugYUXzi8pj8HXdSH3+9q4grpd3YGFD2ihnyGEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhOzrs6ldd6G7j7Jlqmim6xhhwnsyKJ4ixLPrBBeHglDVGZCYvJA6iz5XeiHAQiY1yyeN9xOlsCMB/7VzqQN5ekvC74BMrdgy8sbecO3vFr7ZPU1le/hEfrjr/aIewuU+IMKA/0cBQvR95b1FG773X0EWP1ZAK9tYlhviN1v40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dWFsteE5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dWFsteE5"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64FFE63D;
	Wed,  6 May 2026 16:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778077313;
	bh=0Uq1YugYUXzi8pj8HXdSH3+9q4grpd3YGFD2ihnyGEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWFsteE5Yud9FRc62Ue8FUO1vdIwK1vF//+75iUC2X7IJ1qEGI5wf7uLMVSqUixQL
	 CYkQY5kk6D7xRaLVAInGyyQB7WpzGQiea6RSDdQasbUA8cRbp62zKd8B/r+vafVkbC
	 XaHtZPTfgKXiZBHn4Bu0KHJZEpO9vq4rEUHNlxPM=
Date: Wed, 6 May 2026 17:21:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, martink@posteo.de,
	rmfrfs@gmail.com, kernel@puri.sm, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	martin.kepplinger@puri.sm, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <20260506142155.GR1598374@killaraus.ideasonboard.com>
References: <20260506090124.2960477-1-robby.cai@nxp.com>
 <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>

On Wed, May 06, 2026 at 03:33:57PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2026 11:01, Robby Cai wrote:
> > The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
> > labels, which is confusing for an i.MX8MQ binding. Rename the labels to
> > imx8mq_mipi_csi_{in,out} for consistency.
> > 
> > Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
> 
> Nothing to fix here. Otherwise explain the bug.
> 
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > index 4fcfc4fd3565..71f79651dd96 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > @@ -220,7 +220,7 @@ examples:
> >              port@0 {
> >                  reg = <0>;
> >  
> > -                imx8mm_mipi_csi_in: endpoint {
> > +                imx8mq_mipi_csi_in: endpoint {
> 
> Drop the labels instead - they are not used.

I think the label has value, it improves readability of the example by
making the purpose of the endpoints more explicit. I won't fight for it
though, I know it's hard to change your mind.

> This is just churn and for sure not a fix.
> 
> NAK

-- 
Regards,

Laurent Pinchart
