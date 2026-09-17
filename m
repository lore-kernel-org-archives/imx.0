Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3843AFB01
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665344; cv=pass; b=MSxRObFTYhKDsho4a3Fr2KX9CoPwK6enMn/T9Fy8wYIWcBc1iGukzAWQN7e5y3rAnHJVsynhKi8AcV2QVatw8LM10OM38kWioHwgbbT6iJGrPob/fB2iwRDHX40VzeGJJdb/aOzXZlSw14XUp3dnSt8ECSyyISMYUYiErL/pobM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665344; c=relaxed/simple;
	bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEZZh2/EcmCQltQhs213ykpuMmtcZaFt+t1JpEzxp+IJVvOZ1LPiGt/Mcc3C8cPlK1efdE2TAEsWO13E/UC8i9XQytL9V741h2V0yKkVuNVhCRr3vlgaYN6owHVGZwQqpnLsLOlt43SGugkqppj52ZBulM/n7q6lrqA7GWDfbLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUJ8ja3l; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUJ8ja3l"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso8504065e9.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 10:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789665341; cv=none;
        d=google.com; s=arc-20260327;
        b=Vp/ZipJE2bjlWxQ4uN7TZC2tT5lzgoo7VSBCzsyzXZoudNyaBv8MiuMauuKBczlHAo
         f1ioff4O0MLJfHw45bbve0bkUGlIECKbQGMzU3eMNJZJnX7mNL9sDeQSXwzG5C3jpNqP
         OydOtJGhhBOkrJkcgsPocQ+K6IlCgnr5LysGMeOTH+b/v69uHLjVuBF1miocUbJq6vto
         4O+pbAhUeD4fGxnQdTqEA4JEYiuKMI2z/lv3cIErPBluAMFvoLcF4lDZSi/XehMJO6lk
         6TDfbGLibsuEqbxbV+EKY+oSc3AWWovudZY/eHmBXjhtZ8PiQXYAao4eTY+TfDPOh7N5
         OtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        fh=hWnRSPtz9gLWkitqyDiPtXOe2fjRh1v/FgtipLqTv8E=;
        b=mQDi+wAY38y0qV8c1fV3LvZbqW6ICWi+rb3KxUMjMA0bXO/qgH1WPzFeQv8Ww8W1MM
         clTt8zQGPfs2lVcHOJOUrkGZQciCQSPLfl5Bu7jmuvXluuPdm5bXVkAi6gkkEvDHIUkz
         72k2oEdr2AvFDim25O7ntcgmaie5Imf84oQTBbqWhJMtzdw7YMdiDNwfI8cMbewBxu15
         HGBnxLQJgm3tm7S14GZKiCU/E3By67cutcTNgHKfmH7phOXsWdYM1Boc/ajPnutguOHr
         TDewE5ISZ7hLh4BwrIncWleomS8Dk3U+s36BSwaG67BFPtE+t1v9TUVEuJZPJUE3LpAW
         eFnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789665341; x=1790270141; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        b=QUJ8ja3lIX5bOnG6wCPwC9uMGhTr0DKBEpTupE67YF/HNyB1I9e2kCYMPI/BND1rRF
         35DfHS2tuNRsOHwWPnTM7kW8VTTt5pflcVQ1lkMTXAuWOmrMA4+bvNIaEYI2JkAfYkHe
         9eNgrloLiGgpvr+Zl38fXf/5c4F6YulXADU4F769pt4dO33Br2WyCZUlQT/tqeiSEFyU
         jGSPNUUzjM50Wmz79MaRUxf+8pXr9wjmQs3E7FgtNiRX25SLxzXiPSDLbm+/jnjD+6o1
         o9mgJpDvMfj3GkWas6qNRVuKzxqbE/Adepp+8HnQc3xoz2CNezZT6t1UrGumuuyUeHJe
         8XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665341; x=1790270141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RyOCsoLeUmQHrPIIalVxsKpIalSmo1jF9l7pbYcnRnc=;
        b=sfmiX/K9TLzefg6M7IDfYq7kNQpy+aqZCwQ9oN8mW8itjQ989aveODwQmhxUFJXEh7
         EZkXQvzznXHVGxyEw6BfRLeHTD+d+F7MDgoqh4rKtxD28p1iFbqpcmyu66BIrLC3J3FP
         69pBbowh1I0NK9tvWa6ABpLYMua5oxPkQ9q8NgwPFL1ugFiFYERJKGqK/95TbREMbgMk
         LSea4xUMsaMOsAKobj1ffqgGsYrTqC9no2PXkapSkUfyphB+qlLqHucpc0d3jMYe6xpp
         nGfzj8qUhgaBoeZTxtg+nZRryrckvp5xiqBojXwxB6J4ruT4SJDrYXF9/DbKvkNJe1hG
         cwdw==
X-Forwarded-Encrypted: i=1; AKwUvBwsccJreAQ7aJOWSb3jLOL8rzBdLS6yC7HqSJBMzhbtkPEUWpc8aq+zQEIFu6RLXAXyg7A=@lists.linux.dev
X-Gm-Message-State: AFuF++krjG/Llq6XztB/pogih/ywhOrNoAt1SP5HmNvMAw8VKCFPvzLi
	Pw8p/Uk6rcQsi+7sE5fPFgcyk83CtHGr9iiaXzXNY4kbbzLxURrR3NFcepVqLkrPcNRK7SZ739E
	qaPVtDYS0rVbE2IppYgCpTabiRqDWEfo=
X-Gm-Gg: AYBFou2qJoiI8wqy/KRB9syVvEMgPqvvZ4D89jBHvxmYSW+UwF4+63otwIYjR1ge4k0
	VTBTT+AB0Od4+JhNM/i3AYjMsCCMncAUYMRvTHdlvYCEfGRdLGYg8bs5SA/Cr4taFJlBn/XmAe7
	qZHFbVJmuie/pjgfzWqovnJ+u7r/uMflTocp9f6fh3Jsk6sPil33WIjaPPN1KJlCFA39rpTut7d
	wFer6JtLK1FgUlPy5w25JQSLzt//8cFH5onDkKZ60re+h+N7VlwnE/urHkhLQpVwJrKdb3UrjZe
	jxf83ynUSQ0G5u2rG++hNbpIS3ODnwkbZVWLEign5Nr8LzZrrhgzt2nYVAvhmkBWSWaoYYIbipW
	Kh7GzKoEkDqNeoGpHfRJYg8AdqZtq6reZPgNPnwlJT9moITRWnybQe5oaD+e1oKUS3rsVFmNtbx
	p9xhzo06OEc15eZ5TcJfbiZEvoDaasIdpRUyjiNchr3+mNde4pbE7IWvZSUScMtEcCCs7hkLjgu
	Xv/+hU16wFlg8HbTN5w4+otvVRbqIATmWxfGcoHzhYu/wCHeqeD80aarA==
X-Received: by 2002:a05:600d:4447:20b0:49f:bcce:13f5 with SMTP id
 5b1f17b1804b1-49fbcce1a1dmr41833255e9.24.1789665341002; Thu, 17 Sep 2026
 10:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
 <aqpgUPWUGZp5Cjzt@hovoldconsulting.com> <aqq_ymTi1I951uQp@SMW015318>
 <20260917102429.00002faf@gmail.com> <20260917104233.00007a85@gmail.com> <aqwUky1jSMGbiXCf@SMW015318>
In-Reply-To: <aqwUky1jSMGbiXCf@SMW015318>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 17 Sep 2026 19:15:29 +0200
X-Gm-Features: AcwNN1Vx0h8quqew4hNT7uRkgLUXPW_uCN9SLNcg_QuQOygx9-cYOKOmc0EAV7A
Message-ID: <CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: imx: add missing pm_runtime_dont_use_autosuspend()
 calls
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:
> > On Thu, 17 Sep 2026 10:24:29 +0200
> > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> >
> > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > >
> > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:
> > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:
> > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > the missing calls.
> > > > >
> > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > resource leaks. [1][2]
> > > > >
> > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > will soon also taint the kernel).
> > > > >
> > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > which is fine in itself.
> > > >
> > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > include these pair functions.
> > > >
> > > > I get many similar patches since scan tools is more powerful now.
> > >
> > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > patchset.
> > >
> >
> > On second thought, some drivers do tend to disable PM runtime system sleep
> > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > enable/disable.
>
> if runtime pm disable, does autosuspend still work? suppose it should be
> disable also

If we add dont_use_autosuspend to disable then every time the system suspends
and resumes we lose the autosuspend config, meaning it will never autosuspend
again.

I guess adding dont_use manually to the driver's remove() function is the only
way (which according to my cocci script it's 195 drivers that should be patched)

--
Kind regards,
Joshua Crofts
