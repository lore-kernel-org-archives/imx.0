Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.124.121.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784417;
	b=VKiufyie/mUkktXirZXoXs+a2cJ+9FuzI34MoI7ASu35j9ac32Kz3n5ccdN/MkOFlhg3
	 bpd+wNxA9LSvXKqZLlPNhAP+M5TOQ7I0nNNL5w5ctMHXlBqT0TexPETV/uFvhgBRlm+YC
	 SRQsQahh5tpKbruoP75MZ9xLGmuxKzCGX0Z61erFKwnFDAVs8SemkDmoT0pdoVne+JuL6
	 GKlZFiZuCZiIKekD/jlHYJKZfXtLw/1OsrQW2+UCztaNAweJfKTDpLqr7NNrqQJNCJ4Xt
	 hw+yJtCbDv0HczNn6ojEq5R9Fz3wZ27Pkr40grnq1uZ1ogVHg+KlaDG5dMd+/aYMoaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784417;
	h=DMARC-Filter:DKIM-Signature:X-MSG-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=osCZa1wC+Zvu9D8Dq/xApsZMIP//8BE/s4RirJrsI2Q=;
	b=lcevmf/7A6qxQeUUuNro8XUAVlIGIbzfY8TjynQPBRDtTADsTb0WI4d1bd00sjSkwszh
	 +7UsKwV3My6UVcu8IsxKvABRnhA3cQESzDcTqcQkagZtAEWcnKHXMggJjaHN5yqbbrjEu
	 M5BzMlCP0SS3ycimVSd8po9G3OfCTqlUQ1RVEAJyHx7vFIGgAPLNH88fytsA2mRysrxt2
	 dBzfmH/qw0mZ9IC0CUkH6urPziA9tWOgcQ/FBk1ZvryOiF2Vsu6qvizqWx9mx+DpOjcEz
	 r8AUsq8CY2oJ+i3wMJELjHoNs2XBcWpj6jYo7ceuKCt2D+qg/dIrEIBxfu0hy7K20kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=zanders.be;
	spf=pass smtp.mailfrom=zanders.be;
	dkim=pass header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=RuJ9kj5Y;
	arc=none smtp.remote-ip=94.124.121.40
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06751606A324
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 13:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06751606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zanders.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zanders.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=RuJ9kj5Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=message-id:date:references:in-reply-to:cc:to:from:subject:
	 content-transfer-encoding:content-type:mime-version:from;
	bh=osCZa1wC+Zvu9D8Dq/xApsZMIP//8BE/s4RirJrsI2Q=;
	b=RuJ9kj5Y2L6gy8CzNDv5KC21f0vdqzHAs+tLCQ9bvNOA7E7s+P3WKWTAJxKgVM5IWT/C1q2tXB16F
	 wxSScPDQxhX9eTDfH8OPDLJbnidzJ+Ys7SUmyG4HG03hz4FLo2yTVG6Qjo0IY2YPJDPlxGd1qY+wNf
	 A5VOBgIwPp2Ho9czxEv4fYxzCOxlzrx09r8OrlQ9+07oyMgqNSwykbAw+ZpS8Gi0K4/A4B6OKvpFx8
	 nMGJGHR8N31/B/ipx6NcOOfDQmo9RuChqPOLiQRLRe35MV8GgIrkGRvqElRUUILuWPsu3vB7oSEBb7
	 +gsDhClb3t4qAi/Dzd6drO1NpoYahFg==
X-MSG-ID: 665eb1ad-ea62-11f1-be32-0050568164d1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix probe error path when
 CONFIG_PM=N
From: Maarten Zanders <maarten@zanders.be>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
 Maarten Zanders <maarten@zanders.be>, imx@lists.linux.dev, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
References: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
Date: Fri, 27 Nov 2026 13:59:30 +0100
Message-Id: <179578437089.42564.6953197767312597216.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784406; l=238;
 i=maarten@zanders.be; s=20261117; h=from:subject:message-id;
 bh=59DQD1G1iSgtJQdIAgk4d9+k79+O6x9lxm3IYgwvoOo=;
 b=e3D19xOOtoV2U718Mz3lwuPTVFovPhvY4KEDtNZeLW3iio1fbftSSU1cuK6NptmQs54s5MxUU
 z9GsWJ5AbhVB35PSMvVvKXGDoeAYyKrtynrwXKswgN0UH5OVRyVc7XF
X-Developer-Key: i=maarten@zanders.be; a=ed25519;
 pk=9vkWF6gtn9DS+97n+W487XUEhrI3+9cvA7Fdon8T1uI=

On Thu, 26 Nov 2026 21:32:39 +0800, Yige Jiang <yigejiang86@gmail.com> wrote:
> mtd: rawnand: gpmi: fix probe error path when CONFIG_PM=N

Reviewed-by: Maarten Zanders <maarten@zanders.be>

-- 
Maarten Zanders <maarten@zanders.be>
