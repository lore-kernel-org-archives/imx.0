Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1C3A3E9A;
	Mon, 10 Aug 2026 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345944; cv=none; b=V5xYZEp0rnplF6MvnJKmbApgxbAk9NCyQ0t4dGdmPHZsfcNX61XJx73CfopHKpWgveePbdXArgPykUgbJKjn/bGPM1AWnCrHo3jF8PhfP7YoYH7+kSHhpQH+Ci+3m3gYlW6m1DThhfJNR9b32Te8TG2ePizPnTebJsQt06rzQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345944; c=relaxed/simple;
	bh=ied/MJFAUe4DTtXY8m0SlELwnulMoDGKPSmznHyV8vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMLNic6Jagjz7fwqDbQn5aXBJxNWapxfiUEIrUci5K/r/2tFKksfpi96TAylpOQZ8uBW8510ecMqfYNlqr/2b4KFBObYz36dZUuHxmGhm8eKhoYjSpabwubSsY9V1dR+k34ZYbXRRHSmsBW4G0VfXc4o9Vj/tPS+yLEnT32ZQIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUqmyhbf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUqmyhbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81821F000E9;
	Mon, 10 Aug 2026 07:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345943;
	bh=COaUeTCLiC6/x/enOdcDm7m3J3BQbpu2C+HiphZ+rII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUqmyhbfMBOS1FXtoKdFP+hMikiAiRZebva27LL+5ide3tHHtTYOaz/xuo9YdJPr+
	 yJkLroRSTobte/93yBnmsugwgHF3OzGCZVAIAEIfub5qJJGzwe8OH+z01ym8JW6wiQ
	 5jx4ZgLMdIPEHKQXm/AxjrsWvQLubsjqFiE16VyODK4VrMdmfOXOuhTnicHhOXVqi/
	 nIUM6ZObJhU+KTiw5D8pQHsELpQL9+4zAaaw+4JGPGpdm6Bdtdpa6178a/tLpXwOWn
	 mfdUPkDdALWesk3UNN8aZToizZEO0/3lAqu7aKZ8HNhrFyhHHnbxk4eT2yWpYuj6he
	 GrwUXWKMoEHPA==
Date: Mon, 10 Aug 2026 09:12:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
Message-ID: <20260810-magic-olive-gecko-5e8a36@quoll>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com>
 <anH5i7y3JkB1moee@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anH5i7y3JkB1moee@SMW015318>

On Tue, Aug 04, 2026 at 09:39:07AM -0500, Frank Li wrote:
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pairs
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensures
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
> 
> if no existing upstream DTS file use it, you can direct replace with ports

And what about all other users of this binding?

Best regards,
Krzysztof

