Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39043B52E1
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114131; cv=none; b=Rgj7+g3o9/5ojiDFCHm5puoTdGQfRPdKvmIrFjOn+GPhkzNIAO/2XCYZSo/8cu3gGA6o4UjMc6dSspdX/RjrWY5qZSsY2jUQhYFiD/W8L1VfOioVaRxatQJBM3aPmUUPYGYwKA/l0qwhZefq2/rHhiwRV4mPqA9PpZLyvnvW0VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114131; c=relaxed/simple;
	bh=NxatYKgP/OzTCLlin/VcjXCcZs4g30Boni3dtcqSfoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL9m08fae7rqLLdrL8sPwxiHzKPO8yaqA7ttG57bjNUjWkKgZiO+DQqyiTyJ7NtzIU4w5jyDbT4Wt8cRP/zrvRutuulphI8/+5EYvjvZQN50JBEab25meGbdLbJlnYa47udh2Fujgng/f88YYAqrENgBysWecUl+3zXmGRsbmLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8740497;
	Thu, 26 Feb 2026 05:55:17 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA7673F62B;
	Thu, 26 Feb 2026 05:55:21 -0800 (PST)
Date: Thu, 26 Feb 2026 13:55:13 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Message-ID: <aaBQwXHA1pAQ4XHF@pluto>
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
 <aZ2aBD_u_RVhgsei@pluto>
 <b4c42f88-80fb-488b-9ca5-95f5795fd2f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4c42f88-80fb-488b-9ca5-95f5795fd2f8@oss.qualcomm.com>

On Wed, Feb 25, 2026 at 12:42:08PM +0100, Krzysztof Kozlowski wrote:
> On 24/02/2026 13:31, Cristian Marussi wrote:
> > On Tue, Feb 24, 2026 at 11:43:38AM +0100, Krzysztof Kozlowski wrote:
> >> Severale functions operating on the 'handle' pointer, like
> > 
> > Hi Krzysztof,

Hi,

> > 
> >> scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
> >> to const thus they should not modify the handle.  In fact that's a false
> >> statement, because first thing these functions do is drop the cast to
> >> const with container_of:
> > 
> > Thanks for this first of all...
> > 
> > ...but :D
> > 
> > ... the SCMI stack attempts to follow a sort of layered design, so roughly
> > we have transport, core, protocols and finally SCMI Drivers.
> > 
> > Each of these layers has its own responsabilities and the aim was to
> > enforce some sort of isolation between these layers, OR even between
> > different disjoint features within the same layer, if it made sense,
> > like with the notification subsystem within the core...
> > 
> > Now, given that all of the above must be attained using our beloved C
> > language, such attempt to enforce isolation between such 'islands' with
> > different responsibilities is based on:
> > 
> >  - fully opaque pointers/handles...like the ph protocol handels within
> >    SCMI drivers...best way to do it..if you cannot even peek into an
> >    object you certainly cannot mess with it...
> > 
> >  - some 'constification' when passing around some nonm-opaque references
> >    across such boundaries
> > 
> > So, when you say that some of these functions sports a fake const
> > reference, is certainly true to some extent, BUT you miss the fact that
> > usually the const is meant to stop the CALLER from messing freely with
> > the handle and instead enforce the usage of a dedicated helper that sits
> > in another layer...
> 
> The caller can mess with the handle, because of container_of() cast, so
> there is nothing stopping it. I understand you want to express that
> handle is somehow unchangeable but then as you mentioned - it should be
> opaque pointer.
> 

Well no, the caller who calls from within the _protocol_init code can only
do what the available function (set_priv) allows him to do when called....
...like setting the priv field....and scmi_set_protocol_priv, which live in
another 'logical island', embeds that logic....from within protocol_init
you cannot get to the protocol instance directly simply because you dont
have the definition of struct nor the ph_to_pi() macros...

Also scmi_set_protocol_priv() uses the const ph to access the container
pi and change that...NOT the ph object...even though clearly it could once
it has pi (as you pointed out)....but that would be a bug...no ?

... on the other side dropping the const from the protocol_init funcs as
you suggest would mean that immediately you could do from within the protocol
layer stuff like:

	ph->version = 0x12345;

...while now you can only read ph->version, since it is discovered
negoatiated and set by the core SCMI stack and so it is NOT meant to be
touched by the protocol layer, while it has to be freely modificable by
the core...(sp it cannot be real const in the core)

Yes, ideally ph would be better as an opaque object of course, like it
appears to the SCMI drivers when it is used to call proto_ops, BUT the
attempt here was to maximize isolation while also keeping the thing
practically usable AND without having to export zillion symbols...

...that is the reason also for ph-embeeded xops/hops...if you make ph fully
opaque also to the protocol layer you will have to expose and EXPORT
xops/hops since vendor protocols can be loadable modules, and in general
all across the SCMI stack we generally always chose to export the minimum
possible number of symbols and a few handles with attached ops to let the
stack work, since if not, given the nature of the SCMI protocol that is
highly extensible, we would have ended up with a constantly increasing
number of exported symbols to maintain...
(imagine to export all of scmi_protocol.h)

I agree that the current const usage patterns in the stack are semantically
slightly off at time, but what is the real benefit of dropping such fake
const ?

...because on one side they do stop any attempt to mess with the internals
of the handles IF such attempts comes from a context in which the objects
are NOT supposed to be touched, and so, in some way enforce and constraint
the developer writing these protocols (standard or vendor) to 'behave'

...BUT, on the other side,  what would be the gain in having such consts
insteaD more pedantically applied (dropepd) ? What are the compilation time
benefits that you mention ?

Thanks,
Cristian
