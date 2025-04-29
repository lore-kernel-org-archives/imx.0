Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D66526FA5A
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918422; cv=none; b=odWPWz5fxNMKnyaLrqDXIMgZzHMVWbmtsNDMtjuk9WvCJh5+QHWOCxq/GVZzbnyYkNqSNSUrsVvA+v+v4OnLBBkz2oa0rkjBSTjrk26Za3S4nURWiCgLFi9rLdfBeXJyvs8IilTUjV2bwcrTkCQTrurUh/RIx+Yz2cUYFpsmp08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918422; c=relaxed/simple;
	bh=YDZEjmuK8S5SPKS8HfZwM58XV7Ov7XxPKOPF2M1Ws6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fAEjydIRon0254xxF7QqayvbrUV6y1KC2Su7jJon2QEV7AVX864HGP273j/fg66xWAXaQlr2qRwTggRZMKBY8VeoLllFBAqWdnRdKP2OAH5Y5lPdPVvD/p+vR7OvqOzObQW8RDB+ntl4AUyYiUztNRcLG//TlfNDDQuMdA09EEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SMfuSMNZ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SMfuSMNZ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D70DE43218;
	Tue, 29 Apr 2025 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPVpK8S6KKRUozQUb8KiO23QtW/NHAE+krU+hOxvdvU=;
	b=SMfuSMNZY+y6rAX5xUOY91yY/5MjTlunQLcg95OqnBD2WZCeyUK40y7LnEmGEKpPz05wti
	wAXRZWnIeiCSoVSUSbYmgXQ1FvZnXP44MZL2i/K+45g+it7igWrrkElf2Zdu5MJJowy1En
	Afd9+eKkfhcH/cRDXxz5yF45rzEXOD/OuTMKoP7UQfFcrqAngmLkwLFsjFoB6p1CbXzk6v
	gqXE8rUWneRMwtBn4AAiD/Ome25VjrnwnUmpAOUwSItEsiY7ZQ/VFKR63PtbarIPX0qyWy
	S0DYXrzIIfqThuNqQ92yaV8Qt8udtw4Dez5xLQzv1/1j7b+XfuRvDuBl304+7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: robh@kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 krzk+dt@kernel.org, linux-mtd@lists.infradead.org, masahiroy@kernel.org, 
 nathan@kernel.org, nicolas.schier@linux.dev, richard@nod.at, 
 vigneshr@ti.com
In-Reply-To: <20250411200858.3266447-1-Frank.Li@nxp.com>
References: <20250411200858.3266447-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert vf610-nfc to yaml
 format
Message-Id: <174591841673.992719.14553059335435921742.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:20:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggru
 gdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrshgthhhivghrsehlihhnuhigrdguvghvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrght
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 11 Apr 2025 16:08:58 -0400, Frank Li wrote:
> Convert binding doc vf610-nfc to yaml format.
> 
> Additional changes:
> - ref to nand-controller.yaml.
> - include arm-gic.h and vf610-clock.h in examples.
> - add clocks and clock-names description.
> - remove #address-cells, #size-cells assigned-clocks and
> assigned-clock-rates.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] dt-bindings: mtd: convert vf610-nfc to yaml format
      commit: 78693ff68c8c8aa8b8553351e8548386cccdd0c6

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

