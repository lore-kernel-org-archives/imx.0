Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394093D5259
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205239; cv=pass; b=srOCP47vNHnQo5W+FbYoDYt+FKXwvzWoZDpFEFT1R3kpjycrrzidOXF6OrJ9JIsq53ORVLiagmoMwLmD1riuCebwPy4Ix4SVhu9i7bA3cY0fO5TBzzm9uAk+MJ56jXT3IdJqYCCf+FpC69kQAbo/mBO8ozUg/ByP6WKy3p8BTXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205239; c=relaxed/simple;
	bh=BLLQuyw5B/L37gprXVSCeQEGNy84sZq5SF6Ql4eeHUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uc1F7QfDr0y3NkPz8Y2f+AS1NsWPnkK9ovX+RlhtRqAlDcg86hwOa2r4itM6KVQRclYWthHCIumsHS/HDhNcOQCbAk5EHA9Cp/SSwAuJDg33JRrmYtJhBCY0rtTUBAZsL/9ce8VoqHR3HNBJACaQKOwC5RgCPYvLoG99qvFJsWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmrAFoQL; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmrAFoQL"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd490be5fso8448756e87.2
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 03:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770205237; cv=none;
        d=google.com; s=arc-20240605;
        b=DTVhOiq8gg8I8uJoSCc8NAA5U3tr8c972YeRIBK9ISqvi8GCjznvXrdHBvxuFw+Aq5
         7Ay8u/x+WjYq/PBNQPwXnRyBqaulobgHa031yQMchtxgB9Yt7MWj8IeqLbzCpxk224lA
         IuBYx2NtscwPxVuiT7AfE39mohBD07g9vbMAZ3eB/uYk4CUn7bfR7InHRUDnbV78BT6o
         zegTfErmYFLZsMQdnX/xLGps+xW1HQZ+yT8q5HSP28BxrmT98FNY7Tb7QlRfQXMjoHRr
         7M8ZmORFxg2NN5n4+/0472Comf1hKCYkOfSITtl3tg1QgXKdEQ061Sm7N/NNUvuI2Lp1
         /aAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=;
        fh=R6sPTN4aEU+3WhWFvCoqX7U656BlrDYJ4/U/hh/IIKQ=;
        b=cpphvMIsKaZiOwbOLTwzqw9VsElNzeX38gIDpf1S3HOkRdnvNBvnhneyQQ738PjKBH
         1Fqzvp2C7dceAeaN0Dc0mA7oBTDZHyP0HiILZklPvLcdA04knMbJhgfIT/QMyhk7K8pV
         rfy0co6WSDg1/TFakcw9y82/36cdKWvhHYwDcbbxqo5y5VFGCDNw4GOPAkjkMnkF9mls
         a7ke5uBfHiVB9vfsS4lCbSFmOk8wXwn5yZlg0zEdBfOAp+LZJamXxRIfdeNtBD9IqWRu
         krwgrsjbWgAxtYe3oozApDBETnHlPrP4wjixVp9ESauINju9RItQ1VCGisZgCFj8Pcuk
         Hckg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770205237; x=1770810037; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=;
        b=GmrAFoQLjTpsxyDT86QuKWp8Tlb1pgeynz0TJZ2r4ggzj925qxp+m05mFvySJiEbLm
         jYe2SFrxb82iVzo4hBd5TvrPdSp/7Po/haDIkKXQsjNj88RXjPtUJMt6aalTGNYoEigd
         o5/ZUKhWSCEprUFfw8D0SFiHnB0nfYF0gVoJSZ62tluVby7ZkMAUsPHF4K5jhzt2vuNw
         YCQXMnGy9LZcISEG09n9MTyqnPvBTAL89Ro+XEIR55O5g3f5jN4jjRZF3yqnKuqzwptG
         nKQtDZSrQtNiYRgIqpQMboC840MXsIzVPx5USXP8CTPtu9bVzbwyALma5FvLzQF1jAlk
         GvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770205237; x=1770810037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=;
        b=Y/6znB49CnPNHYhG0jVkgNhrXrYHfZWMo8LvwCmPh4ensa/fgNEztwlKhkkgLqJcyk
         mPwYQ038L2bodCkFHS9tcoRvDtejq+hblPrPdrg85JjbekCFv06cMdCtO8LDWIa2mqf6
         pCHToiQqR3RbqQhQaZ7TDbE1fg/SRTaFdZNCzjp8kyL9Lsp+DfFylrU+O0KBiXcrj2Lt
         7aXKOeW5QOBDmC+G2y0E/mexkOkYu/jLcpdK1oEbj21JN7Or2OpGopwiAN5Anw9hUlhe
         Y3TvHkoNsJLM1MfozsK9tsJyFemZgWXY9ls3JlyOHnVPN8+/4AhU/BrH+ccAvQJoca+v
         +Psg==
X-Forwarded-Encrypted: i=1; AJvYcCX1aqMFlZg7SC4z98L2+3gi2UMK2v3BBxrljfrTIutVqAIwgxSO9HpdzkdmFveCHrazg8I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAQMEuLlvwrla0ITUZFcDz534qp5NH7SILEpi22EOChfG0AhyW
	dwZDMjgZzPVlqb1lf8p/EfskDCOHP3rR0zkPBAaJNjxnwszfLl/q2kHGb+7Mx5cSzLNPToSNLq7
	pxNxxBkWfzlUpReYl0zY2xJNLz7xwjwg+oop6wn+4Cw==
X-Gm-Gg: AZuq6aJp25hJt7gKliPpSC/VhpCiBhO3/MB4TIXT7L5d78zz18z2i8EnD9FEcOuSgPR
	6wIoAY+ZYiZVbGv32udx5ji5LgIl3gwohskBvRQiVmBBNN+HNfIfL5kMjOIdDhV42OwJ5+uYkpZ
	CLfpsh+oJnaOLXw9DOHcSga+/V9e/BaeCq1fnxrzOOWj/3hh9IJs68HGafV4u9IrmMlJpVMniCL
	zyCYMhAXMOZf4n0ffJAIKQPtUiOqHn+8slQ7K6HYaJ8a9T+sr47nz2fA80nsyIgafg6LGr+5NlV
	XlgXSkc=
X-Received: by 2002:a05:6512:1085:b0:59e:14f:a4d7 with SMTP id
 2adb3069b0e04-59e38c2d748mr1017297e87.27.1770205237316; Wed, 04 Feb 2026
 03:40:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202074730.738760-1-xu.yang_2@nxp.com> <CAPDyKFpqfo1R8Qkq284L9DTURjZnvm_n8W3a6KQTomg7A-M_Ug@mail.gmail.com>
 <lh3cb2r3qvv2ar76ai33fjiuseqyiwoks2zjrmowknvut4qfcg@2db76miyk4wn>
In-Reply-To: <lh3cb2r3qvv2ar76ai33fjiuseqyiwoks2zjrmowknvut4qfcg@2db76miyk4wn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 12:40:01 +0100
X-Gm-Features: AZwV_QiX5AkXx_w9Zse93HKg4-tfhffXTYB6o8jqYrd0yS7lV2JQJGMo75ani6o
Message-ID: <CAPDyKFpFfhMTtAp63cjB2eVR78mbhBEzzSBr1Zxk-14YT448Lw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: imx8mp-blk-ctrl: set awake path for
 power_dev if attached device needs wakeup
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Feb 2026 at 09:48, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 12:06:28PM +0100, Ulf Hansson wrote:
> > On Mon, 2 Feb 2026 at 08:46, Xu Yang <xu.yang_2@nxp.com> wrote:
> > > +
> > > +               list_for_each_entry(pdd, &domain->genpd.dev_list, list_node) {
> > > +                       if (device_awake_path(pdd->dev)) {
> > > +                               device_set_awake_path(domain->power_dev);
> > > +                               break;
> > > +                       }
> > > +               }
> >
> > This is really messy in my opinion. Ideally the above should not be
> > used by a genpd provider as it's internal data structures are managed
> > by genpd itself.
> >
> > If I understand correctly, this problem boils down to the fact that we
> > should have tried harder to model child/parent domains, rather than
> > using runtime PM to manage the parent domains. I understand there are
> > problems with that, due to specific power on/off sequences we have for
> > imx power-domains, but I wonder if those could be managed better by
> > using genpd on/off notifiers?
>
> Indeed. I have tried using subdomain will resolve the wakeup issue because
> the parent domain will manage the child domain. But I shouldn't use
> subdomain and runtime PM way together to avoid any unexpected behaviors
> according to my understanding.

Well, there is nothing wrong with using child/parent domain in
combination with runtime PM.

Although in general using runtime PM to manage parents domains from
child domains, should be better managed by genpd itself.

>
> >
> > Anyway, that said. Rather than walking through the list of devices as
> > above, I suggest that you use the ->power_off() callback for the
> > corresponding genpd(s) to dev in combination with a genpd power on/off
> > notifier for the corresponding genpd that the power_dev is attached
> > to.
> >
> > More precisely, if the "child domain(s)" that corresponds to "dev" has
> > not been powered-off (because device_awake_path() is set for some
> > device) during system suspend, the power-off notifier should return
> > NOTIFY_BAD to prevent the "parent domain" that corresponds to
> > power_dev from being powered-off.
> >
> > Would that work, you think?
>
> Thank you for the suggestion. It works for me.

Great!

>
> With this way the rejected count is increasing. Does this have any impact?
> The count is just used for statistics, right?

Yes, it's used for statistics.

>
> # cat /sys/kernel/debug/pm_genpd/usb-otg2/idle_states
> State          Time Spent(ms) Usage      Rejected   Above      Below
> S0             1203           0          1          0          0
>
> Thanks,
> Xu Yang

Kind regards
Uffe
