Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7051BDC8
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280341; cv=none; b=S2RlTEaLe+Kg0ak1GlL/Q1k3A0OlFutDmZLB76K5wNjim7IB1yMT05lWGyYp0f+ZpYo9dxhKpEVWZtc+I732K46w5feqg44KDT/VuF21UVFGsSqHVUOg1y99rFcpfj01Q9/lDsrl0FaojvzWeAqQOX/za2rhUtcWERHbn8XqHbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280341; c=relaxed/simple;
	bh=YzQrJg/S2A7PM9rT1EAcA+I3pRA4EnsshfBm2/PzeYY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bvIvcHk0NzysxB+WKVMapkUSQn+eNzyocM+G+bYCn6D2HkM39q4S76qwWRuNoxk306qes+OTT07DKbI+pbrmZ0qwO9Yc7JxpWJCXG0uE63JPvVotstIeNO/eyvd7UPWrL9xHT4LsST2OYlGauX/2HJB+Q/Zlyp+M1JH8tLp3cwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VMB4Xryn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mk8j8pJk; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VMB4Xryn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mk8j8pJk"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id E707A1380600;
	Wed, 25 Sep 2024 12:05:29 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 25 Sep 2024 12:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727280329;
	 x=1727366729; bh=1Jou7M4p83DcYzy5Ln4gAWeJqnubiTKkro2D97yUltU=; b=
	VMB4XrynzJA4JABRzZPdOiYDRIosap8SM48qCziC2ikivtNJT0EBLfYiDuXi9l00
	y8kOYz3DKZLPhgt20oG+0X9mfe7hdlBSC1SuAtFCuWrD6XOKHThVH7btAUfkFplx
	O4QvrH5e/Al4rWkEj8g3gR7b3bh5wPHAmgvBhGR5ulFy+QwGO0wGSX96aSeN8Z2r
	+LIZtLIrand6pgLsz9NnQI45vYgWtOlUgHTuJnE6v18JgBOsoRFE5Y4f1ZNejdMF
	slqahInX7D4mBV/aWUl4Zw4RgMrcClvCr3X1VscsnHhhzBpQ4fbwZ/Ea5aRRaavI
	qZDQT0ajzviIPoH6HJ6PcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727280329; x=
	1727366729; bh=1Jou7M4p83DcYzy5Ln4gAWeJqnubiTKkro2D97yUltU=; b=M
	k8j8pJkiwfmDa1GoxI4u76IQwwnbCC/vUDCYqXVc6KVt7FRf0wLBmi587C0zT8l+
	yRJRSF1FhKLsv/HKk+gHSI0kjrG0wh6vLX3tEduNN9Whp0p6cn8VQCPEty1THVkd
	w4nJLv+s/KgUm4/2vShwL7e6gj2/W4e5sjmjxNIH802v1Yh7BCOZTO7QUTyJESr9
	nltvyGw9vSLBeBmW+0Si1BYD9+rzslJR/g+X7pshzCJiWFCkVuQIdfUsutj7foYQ
	681AlG/anny/mI89YeGeelTHgoqwa31N00VItXM6MfZ5ZasV4UV2vAPwjsxvR6HV
	+XKi4PD0jAPJBo7PLlzsA==
X-ME-Sender: <xms:yTT0ZvQORKncCTVSWRYGivmg2IScxDzfzJPuvF-dKWOovWy5YbUrpQ>
    <xme:yTT0ZgyyT-C9g9m8ZDgEqjeHxHX2CTXOgHFve0R1mAYunyYe0oYF9ap6h_S9smKXK
    pmSHObMmTr8-AvYlQo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddthedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhih
    hnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepmhgr
    rhgvgiesuggvnhigrdguvgdprhgtphhtthhopehkvghrnhgvlhesughhqdgvlhgvtghtrh
    honhhitghsrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghr
    mhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    ihhmgieslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:yTT0Zk3vVZ4YcnfDmGBnxe8Qxw_AQlFpd0vVHOZ9JLNraE6FuFPSMA>
    <xmx:yTT0ZvB9dUWaoeuhevthtk2v1EEtrfae2hzuKjyVFuljeSXLyPmR1w>
    <xmx:yTT0ZogDsJdyr7trVOSGVQoy_JRIcS8TozEs7WiY2wtZY477yBsZBQ>
    <xmx:yTT0ZjpNZGvEpWLF0HtOxtSk_uZ4LmC55s7xSNR5MXZUY1NwXmwxhA>
    <xmx:yTT0ZpbNenf67gM6ZAAEIA2-LcLbc2cJBFv6hjXnuvSJ__BCsLbiU6XE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 754232220071; Wed, 25 Sep 2024 12:05:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 16:04:54 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marek Vasut" <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Saravana Kannan" <saravanak@google.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <486054ad-20c2-45f4-a457-c9334afb53ed@app.fastmail.com>
In-Reply-To: <20240925160026.84091-1-marex@denx.de>
References: <20240925160026.84091-1-marex@denx.de>
Subject: Re: [PATCH] soc: imx8m: Probe the SoC driver late
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 25, 2024, at 16:00, Marek Vasut wrote:
> With driver_async_probe=* on kernel command line, the following trace is
> produced because on i.MX8M Plus hardware because the soc-imx8m.c driver
> calls of_clk_get_by_name() which returns -EPROBE_DEFER because the clock
> driver is not yet probed. This was not detected during regular testing
> without driver_async_probe.
>
> Attempt to fix it by probing the SoC driver late, but I don't think that
> is the correct approach here.

I think the correct fix would be to propagate the -EPROBE_DEFER
and return that from imx8_soc_init(), so it gets retried again
after the clock driver.

      Arnd
