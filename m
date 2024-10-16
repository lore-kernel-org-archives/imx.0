Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683045008
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729095715; cv=none; b=mEq6io3YZ57MXQxxndZv79E4qfHwk0R8PGEce+BA9tbOc4uc5SDVTyWitKz1KXdjuXfQMRc26nqiN74xNeebAHWFZMj0ELd5WnGCoYsFbilIIY/ghk13RQc07ZHMIi3xGnIeTwjkRf/MEWeGB5nLSAxvPwJg6dD42fY9r0rMwfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729095715; c=relaxed/simple;
	bh=qeovYdi7CpPLNN994qy1RZcv9OezExwtIaOtFt8xaew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A/LJ6UMprEBLdZv9/oMt3OYhPkfOX7ls5vLmEXFAmE6SbWravQtYn+Iyz+WxbePS1Kxb8dpcYuZi1LosLtGwdDAoYDAqeTNOU2+pqGnwLJjNdweGUaDrjyafH1WNuA6k7iCldOgE0VkpFIgVYMYUwI1I+x45o5BQ48w+fLduBQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vWlse9jx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=isS7/lm3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vWlse9jx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="isS7/lm3"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729095711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQaQbUepXFliR1cX3tgOaDt4nPivfEOlhsElKCDIYDY=;
	b=vWlse9jx1o/wDpaWan2zhRL+WNg6KcuXiooHolUqNpCyIDmk6dwuLGObHFKJMWkbqLaeOx
	2NH3BjMrStwZSzuLLtmpjNZk3Ue3Fja2LpUuSanQGQ5apBAzdVMMCFHycNNW6b1AvVslX7
	Dk5Bk1jZ8BjpUwbJ2/HnANtGGxrNuIedc5TGo1szBldlzGHKgGYYjjzjRJRPYMABTvyC0m
	203avfC/VTRVTO4ZUWjH/6gltmpKbuhP9JpXfs3bWWbMo+DBC6umwl2295KmudFW/CXJlD
	UYEGWylil+BnL2fvzFvu/DpU+eb6zVf6TQU1gl7jszEPIcfg+FnJy3kAsDse+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729095711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oQaQbUepXFliR1cX3tgOaDt4nPivfEOlhsElKCDIYDY=;
	b=isS7/lm3dfKIfTc8pXMSbL0UHFBlo+f3+ad4kbAUN8notVicmutaw9YEbgcLvUB6PgGAPl
	LAekTMz7E5/8uTDw==
To: Frank Li <Frank.Li@nxp.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
 dlemoal@kernel.org, maz@kernel.org, jdmason@kudzu.us, Frank Li
 <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/6] genirq/msi: Add cleanup guard define for
 msi_lock_descs()/msi_unlock_descs()
In-Reply-To: <20241015-ep-msi-v3-1-cedc89a16c1a@nxp.com>
References: <20241015-ep-msi-v3-0-cedc89a16c1a@nxp.com>
 <20241015-ep-msi-v3-1-cedc89a16c1a@nxp.com>
Date: Wed, 16 Oct 2024 18:21:50 +0200
Message-ID: <87frowauht.ffs@tglx>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 15 2024 at 18:07, Frank Li wrote:

> Add a cleanup DEFINE_GUARD macro for msi_lock_descs() and
> msi_unlock_descs() to simplify lock and unlock operations in error
> path.

What for?

Thanks,

        tglx
