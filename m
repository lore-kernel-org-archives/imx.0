Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F73373C01
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773411424; cv=none; b=Ath9E3BcVTWto7NxxkI+skkWfsiR7q9AReKU+AnxuEsBT62TyRCdRL4/wpeEjKFZZDDcGmR48kNv7Od5A+FBFFjl1aeGCFXxQKPN+HO8up0BvRigBdB5PWF9ZVcJsolLc1rQRbJGdjSAz1+vINQonJzGuG10wwuxMX0ng05w9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773411424; c=relaxed/simple;
	bh=hizkWQcLQlP09XYKbRjVlEohQDr8BcTgZ2yrtw/VB0c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShwbYiqQyopVtjpnzPVggISN3uX5O8ERIo52VLv/NFxtT24RR2W/hi+Il8/3mAsewCZnKYUbKV0QcprbH99O9IipomW8LaY2+jxEAHrU6rmFoPLuSm5g62V4IIx78rVTmDR5x0QIM/GCnuP/tPOL+1kmzCvA96X7F3NTh16uSwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RCaFmftu; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RCaFmftu"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1w13Jy-0000000B4eZ-31Gw
	for imx@lists.linux.dev;
	Fri, 13 Mar 2026 15:16:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QST6sI7sni8u9hEYGbPoYRuI7LarkNP2zu//hzs6jko=; b=RCaFmftu5KPdpguutFHifb4OkZ
	BqizKIn+4pFjUopJ/53iSy54wwgcnTqZlQh2NqIMG7s72WS4p4zwXJCeqtWl676Pq+M/Mftjm2Fcb
	jQQ6j9DPQ60cl/iHXmKwIweMQ8u5EcUdfWay+LzJ/mZgVcC44HXVSh+/xcBnXwbqLjGUp3xUW6Zvd
	ZAuuTHCXo6uTUThmDbLqEhCPvS5AQWIiEoWQBq1OusHkLOvZKuqJj8gQx1rUpwmT4sYY+1+IO+WwB
	J38lsgUuHo0jTCUGpynijfcM/dV0uDhg+FbX2xgB5HJdbsJqFv6/N4Hz79OXhqm/0vs0egsReTR38
	/mQR5O8Q==;
Date: Fri, 13 Mar 2026 15:16:43 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mark Brown <broonie@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: fp9931: Make vin-supply
 property as required
Message-ID: <20260313151643.7e6a5805@kemnade.info>
In-Reply-To: <0b9d0512-1164-4178-9bd3-4a3a7505fe1a@sirena.org.uk>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
	<20260313133102.2749890-2-robby.cai@nxp.com>
	<0b9d0512-1164-4178-9bd3-4a3a7505fe1a@sirena.org.uk>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Mar 2026 13:33:36 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Mar 13, 2026 at 09:31:01PM +0800, Robby Cai wrote:
> > The FP9931 requires a vin power supply to operate, so mark vin-supply as
> > a required property in the binding.  
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

in short words (but manually typed, so time-consuming):
s/dt-bindings: regulator:/regulator: dt-bindings:/

Since I once have misunderstood that text block myself:
- this sounds like you are talking about the subject line as a whole
  and not only the prefix.

- Looking at common practice:
   git log  --pretty=format:%s  -- Documentation/devicetree/bindings/regulator/ | sed 's/^\([^:]*\):\([^:]*\):.*/\1:\2/'  | grep binding | head -n 100 | sort | uniq -c
   shows (besides random other stuff) around 70% "regulator: dt-bindings" and 30% "dt-bindings: regulator"
   so chances are that people might see a bunch of "dt-bindings: regulator" (happened to me once)
   if they do not invest time in doing proper statistic, I hove once thought: my prefix is right,
   so lets try to adjust the wording.

- for an unbiased reader, reading
  Documentation/devicetree/bindings/submitting-patches.rst helps

Maybe that helps to reduce some unnecessary churn in the future

Regards,
Andreas
